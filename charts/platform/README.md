# platform

Helm chart for installing the CloudQuery self-hosted platform

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

## Installing the Chart

First create a `secrets.yaml` file with the following content:

```console
cat <<EOF > secrets.yml
platform:
  activationKey: "<activation_key>"
  externalDependencies:
    postgresql_dsn: "<postgres_dsn>"
    clickhouse_dsn: "<clickhouse_dsn>"
EOF
```

To install the chart with the release name `platform`:

```console
$ helm repo add cloudquery https://cloudquery.github.io/helm-charts/
$ helm install platform -n cloudquery --create-namespace cloudquery/platform --values ./secrets.yml
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | ~20.2.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| debug.enabled | bool | `false` | Optional. Enable debug mode. |
| platform.activationKey | string | `""` | Activation key for the self-hosted platform |
| platform.containerSecurityContext | object | `{}` | Specify the container-level security context |
| platform.externalDependencies.clickhouse_dsn | string | `""` | Required: The DSN for the ClickHouse database |
| platform.externalDependencies.postgresql_dsn | string | `""` | Required: The DSN for the Postgres database |
| platform.fullNameOverride | string | `""` | Override the full name |
| platform.image.pullPolicy | string | `"IfNotPresent"` |  |
| platform.image.repository | string | `"us-east1-docker.pkg.dev/cq-cloud-prod/platform/full"` | The image repository to pull from |
| platform.image.tag | string | `"v0.8.0"` | The image version to pull |
| platform.livenessProbe.httpGet.path | string | `"/"` |  |
| platform.livenessProbe.httpGet.port | string | `"api"` |  |
| platform.livenessProbe.periodSeconds | int | `60` |  |
| platform.nameOverride | string | `""` | Override the default name |
| platform.podAnnotations | object | `{}` | Addition pod annotations |
| platform.podLabels | object | `{}` | Addition pod labels |
| platform.podSecurityContext | object | `{}` | Specify the pod-level security context |
| platform.readinessProbe.httpGet.path | string | `"/"` |  |
| platform.readinessProbe.httpGet.port | string | `"api"` |  |
| platform.readinessProbe.periodSeconds | int | `30` |  |
| platform.replicaCount | int | `1` | The number of replicas to deploy |
| platform.resources | object | `{}` | Deployment resources |
| platform.service | object | `{"apiPort":4444,"apiType":"ClusterIP","storagePort":4445,"storageType":"ClusterIP","uiPort":3000,"uiType":"ClusterIP"}` | Specify the ports the container exposes |
| platform.serviceAccount.annotations | object | `{}` |  |
| platform.serviceAccount.automount | bool | `true` |  |
| platform.serviceAccount.create | bool | `false` |  |
| platform.serviceAccount.name | string | `""` |  |
| platform.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| platform.volumes | list | `[]` | Additional volumes on the output Deployment definition. |
| redis | object | `{"auth":{"enabled":false},"enabled":true}` | Redis configuration |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)