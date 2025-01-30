#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly CT_VERSION=v3.6.0
readonly KIND_VERSION=v0.26.0
readonly CLUSTER_NAME=chart-testing
readonly K8S_VERSION=v1.32.0

run_ct_container() {
    echo 'Running or reusing ct container...'

    docker ps -f name=ct | grep -w ct || docker run --rm --interactive --detach --network host --name ct \
        --volume "$(pwd)/ct.yaml:/etc/ct/ct.yaml" \
        --volume "$(pwd):/workdir" \
        --workdir /workdir \
        "quay.io/helmpack/chart-testing:$CT_VERSION" \
        cat
    echo
}

cleanup_ct_container() {
    echo 'Removing ct container...'
    docker kill ct > /dev/null 2>&1

    echo 'Done!'
}

cleanup_kind_cluster() {
    cleanup_ct_container

    echo 'Removing kind cluster...'
    kind delete cluster --name "$CLUSTER_NAME" > /dev/null 2>&1

    echo 'Done!'
}

docker_exec() {
    docker exec --interactive ct "$@"
}

create_kind_cluster() {
    if ! command -v kind > /dev/null 2>&1; then
      echo 'Installing kind...'
      curl -sSLo kind "https://github.com/kubernetes-sigs/kind/releases/download/$KIND_VERSION/kind-linux-amd64"
      chmod +x kind
      sudo mv kind /usr/local/bin/kind
    fi

    echo 'Creating or reusing kind cluster...'
    kind get clusters | grep -v 'No kind clusters found.' || kind create cluster --name "$CLUSTER_NAME" --config kind-config.yaml --image "kindest/node:$K8S_VERSION" --wait 60s --kubeconfig .kind-kubeconfig

    echo 'Copying kubeconfig to container...'
    docker_exec mkdir /root/.kube || echo
    docker cp .kind-kubeconfig ct:/root/.kube/config

    docker_exec kubectl cluster-info
    echo

    docker_exec kubectl get nodes
    echo

    echo 'Cluster ready!'
    echo
}

install_charts() {
    docker_exec ct install --all
    echo
}

main() {
    run_ct_container
    trap cleanup_ct_container EXIT

    create_kind_cluster
    trap cleanup_kind_cluster EXIT
    install_charts
}

main
