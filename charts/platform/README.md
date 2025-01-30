# platform

Helm chart for installing the CloudQuery self-hosted platform

![Version: 0.7.3](https://img.shields.io/badge/Version-0.7.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.50.0](https://img.shields.io/badge/AppVersion-0.50.0-informational?style=flat-square)

## Quickstart

For all instlations, you will need to have a valid activation key, and the DSNs for the Postgres and Clickhouse databases.

Create a `secrets.yaml` file with the following content, replacing `<activation_key>`, `<postgres_dsn>`, and `<clickhouse_dsn>` with the appropriate values:

```console
cat <<EOF > secrets.yml
activationKey: "<activation_key>"
externalDependencies:
  postgresql_dsn: "<postgres_dsn>"
  clickhouse_dsn: "<clickhouse_dsn>"
EOF
```

### Kind Cluster

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

### GKE Cluster

The following shows how to install the chart in a Google Kubernetes Engine (GKE) cluster.

First create a GKE cluster:

```console
gcloud container clusters create-auto <cluster-name> --region <region>
gcloud container clusters get-credentials <cluster-name> --region <region>
```

Create an `ingress.yaml` file with the following content:

```console
ingress:
  enabled: true
  hosts:
    - host: local.cloudquery.io
      paths:
        - path: /
          pathType: Prefix
```

To install the chart with the release name `platform`:

```console
$ helm repo add cloudquery https://cloudquery.github.io/helm-charts/
$ helm install platform -n cloudquery --create-namespace cloudquery/platform --values ./secrets.yml --values ./ingress.yml
```

### AWS EKS Cluster

The following shows how to install the chart in an Amazon Elastic Kubernetes Service (EKS) cluster using the [eksctl](https://eksctl.io/) CLI.

First create an EKS cluster:

```console
eksctl create cluster --name <cluster-name> --region <region> --enable-auto-mode
```

Create a namespace for the cloudquery platform:

```console
kubectl create ns cloudquery
```

Create an ingress class for the ALB ingress controller:

```console
cat <<EOF > ingress-class.yaml
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  labels:
    app.kubernetes.io/name: LoadBalancerController
  name: alb
spec:
  controller: eks.amazonaws.com/alb
EOF
```

Apply the ingress class:

```console
kubectl apply -f ingress-class.yaml -n cloudquery
```

Create an `ingress.yaml` file with the following content:

```console
ingress:
  enabled: true
  className: alb
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
  hosts:
    - host: local.cloudquery.io
      paths:
        - path: /
          pathType: Prefix
```

To install the chart with the release name `platform`:

```console
$ helm repo add cloudquery https://cloudquery.github.io/helm-charts/
$ helm install platform -n cloudquery --create-namespace cloudquery/platform --values ./secrets.yml --values ./ingress.yml
```

## Requirements

Kubernetes: `^1.8.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| activationKey | string | `""` | Activation key for the self-hosted platform |
| containerSecurityContext | object | `{}` | Specify the container-level security context |
| debug.enabled | bool | `false` | Optional. Enable debug mode. |
| externalDependencies.clickhouse_dsn | string | `""` | Required: The DSN for the ClickHouse database |
| externalDependencies.postgresql_dsn | string | `""` | Required: The DSN for the Postgres database |
| externalSecrets | object | `{"cloudquerySecretsKey":"","enabled":false,"externalSecretsRoleARN":"","region":""}` | External secrets configuration |
| externalSecrets.cloudquerySecretsKey | string | `""` | Required: The AWS secret key for the Postgres DSN |
| externalSecrets.enabled | bool | `false` | Optional. Enable external secrets. |
| externalSecrets.externalSecretsRoleARN | string | `""` | Required: The AWS role ARN to assume when fetching the secrets |
| externalSecrets.region | string | `""` | Required: The AWS region where the secrets are stored |
| fullNameOverride | string | `""` | Override the full name |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"us-east1-docker.pkg.dev/cq-cloud-prod/platform/full"` | The image repository to pull from |
| image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.enabled | bool | `false` | Optional. Enable ingress. |
| ingress.hosts[0].host | string | `"local.cloudquery.io"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| jwtPrivateKey | string | `""` | JWT private key for the self-hosted platform - if not provided, a new key will be generated |
| letsEncrypt.email | string | `""` | Required: The email address to use for Let's Encrypt |
| letsEncrypt.enabled | bool | `false` | Optional. Enable Let's Encrypt. |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"api"` |  |
| livenessProbe.periodSeconds | int | `60` |  |
| nameOverride | string | `""` | Override the default name |
| otelCollector | object | `{"database":"default","enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"otel/opentelemetry-collector-contrib","tag":"0.113.0"},"resources":{},"service":{"ports":[{"name":"otlp-grpc","port":4317,"protocol":"TCP","targetPort":4317},{"name":"otlp-http","port":4318,"protocol":"TCP","targetPort":4318}],"type":"ClusterIP"}}` | OTEL Collector configuration |
| otelCollector.database | string | `"default"` | Optional. The database to use for the ClickHouse exporter (should match the ClickHouse DSN) |
| otelCollector.enabled | bool | `true` | Optional. Enable the OTEL Collector. |
| podAnnotations | object | `{}` | Addition pod annotations |
| podLabels | object | `{}` | Addition pod labels |
| podSecurityContext | object | `{}` | Specify the pod-level security context |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"api"` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| replicaCount | int | `1` | The number of replicas to deploy |
| resources | object | `{}` | Deployment resources |
| scheduler | object | `{"address":"scheduler-operator:3001"}` | Specify the scheduler configuration |
| service | object | `{"apiPort":4444,"apiType":"ClusterIP","proxyPort":3000,"proxyType":"ClusterIP","storagePort":4445,"storageType":"ClusterIP","uiPort":3001,"uiType":"ClusterIP"}` | Specify the ports the container exposes |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
