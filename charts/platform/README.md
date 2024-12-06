# platform

Helm chart for installing the CloudQuery self-hosted platform

![Version: 0.2.2](https://img.shields.io/badge/Version-0.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.15.4](https://img.shields.io/badge/AppVersion-0.15.4-informational?style=flat-square)

## Quickstart

The following shows how to install the chart in a local [kind](https://kind.sigs.k8s.io/) cluster, configured to expose ports 80 and 443 on the host machine for ingress.

First create a `kind.config` file with the following content:

```console
cat <<EOF > kind.config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    kubeadmConfigPatches:
      - |
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "ingress-ready=true"
    extraPortMappings:
      - containerPort: 80
        hostPort: 80
        protocol: TCP
      - containerPort: 443
        hostPort: 443
        protocol: TCP
EOF
```

Create the kind cluster:

```console
kind create cluster --config kind.config
```

Install the NGINX Ingress Controller:

```console
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

Wait for the ingress controller to be ready:

```console
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s
```

Create a `secrets.yaml` file with the following content, replacing `<activation_key>`, `<postgres_dsn>`, and `<clickhouse_dsn>` with the appropriate values:

```console
cat <<EOF > secrets.yml
activationKey: "<activation_key>"
externalDependencies:
  postgresql_dsn: "<postgres_dsn>"
  clickhouse_dsn: "<clickhouse_dsn>"
EOF
```

Create an `ingress.yaml` file with the following content:

```console
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: local.cloudquery.io
      paths:
        - path: /
          pathType: ImplementationSpecific
```

To install the chart with the release name `platform`:

```console
$ helm repo add cloudquery https://cloudquery.github.io/helm-charts/
$ helm install platform -n cloudquery --create-namespace cloudquery/platform --values ./secrets.yml --values ./ingress.yml
```

To access the cloudquery platform, add the following line to your `/etc/hosts` file:

```console
127.0.0.1 local.cloudquery.io
```

The cloudquery platform should now be available at [http://local.cloudquery.io](http://local.cloudquery.io).

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | ~20.2.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| activationKey | string | `""` | Activation key for the self-hosted platform |
| containerSecurityContext | object | `{}` | Specify the container-level security context |
| debug.enabled | bool | `false` | Optional. Enable debug mode. |
| externalDependencies.clickhouse_dsn | string | `""` | Required: The DSN for the ClickHouse database |
| externalDependencies.postgresql_dsn | string | `""` | Required: The DSN for the Postgres database |
| fullNameOverride | string | `""` | Override the full name |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"us-east1-docker.pkg.dev/cq-cloud-prod/platform/full"` | The image repository to pull from |
| image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` | Optional. Enable ingress. |
| ingress.hosts[0].host | string | `"local.cloudquery.io"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"api"` |  |
| livenessProbe.periodSeconds | int | `60` |  |
| nameOverride | string | `""` | Override the default name |
| podAnnotations | object | `{}` | Addition pod annotations |
| podLabels | object | `{}` | Addition pod labels |
| podSecurityContext | object | `{}` | Specify the pod-level security context |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"api"` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| redis | object | `{"auth":{"enabled":false},"enabled":true}` | Redis configuration |
| replicaCount | int | `1` | The number of replicas to deploy |
| resources | object | `{}` | Deployment resources |
| service | object | `{"apiPort":4444,"apiType":"ClusterIP","proxyPort":3000,"proxyType":"ClusterIP","storagePort":4445,"storageType":"ClusterIP","uiPort":3001,"uiType":"ClusterIP"}` | Specify the ports the container exposes |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
