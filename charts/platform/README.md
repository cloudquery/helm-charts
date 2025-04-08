# platform

Helm chart for installing the CloudQuery self-hosted platform

![Version: 0.17.3](https://img.shields.io/badge/Version-0.17.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.0](https://img.shields.io/badge/AppVersion-1.5.0-informational?style=flat-square)

## Quickstart

See [Quickstart Kubernetes](https://platform-docs.cloudquery.io/quickstart/quickstart-kubernetes) for a guide to installing on Kubernetes.

## Requirements

Kubernetes: `^1.8.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clickhouse | object | `{"clusterName":"","isCluster":false}` | ClickHouse configuration for cluster support |
| clickhouse.clusterName | string | `""` | ClickHouse cluster name (required when isCluster is true) |
| clickhouse.isCluster | bool | `false` | Whether ClickHouse is running in a clustered environment |
| containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["all"]},"readOnlyRootFilesystem":true}` | Specify the container-level security context |
| debug.enabled | bool | `false` | Optional. Enable debug mode. |
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
| initContainers | object | `{"curl":{"repository":"curlimages/curl","tag":"8.5.0"},"enabled":true,"imagePullPolicy":"IfNotPresent","netcat":{"repository":"toolbelt/netcat","tag":"latest"},"retry":{"interval":5,"maxAttempts":5},"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":10001},"timeout":{"connect":5,"operation":10}}` | Init Container configuration @section Init Containers @descriptionStart Configuration for initialization containers that run before the main application. These containers handle database connectivity checks and schema initialization. @descriptionEnd |
| initContainers.curl | object | `{"repository":"curlimages/curl","tag":"8.5.0"}` | Configuration for the curl container used to initialize ClickHouse |
| initContainers.curl.repository | string | `"curlimages/curl"` | Container image repository for curl |
| initContainers.curl.tag | string | `"8.5.0"` | Container image tag for curl |
| initContainers.enabled | bool | `true` | Enable or disable initialization containers |
| initContainers.imagePullPolicy | string | `"IfNotPresent"` | Image pull policy for init containers |
| initContainers.netcat | object | `{"repository":"toolbelt/netcat","tag":"latest"}` | Configuration for the netcat container used for connectivity checks |
| initContainers.netcat.repository | string | `"toolbelt/netcat"` | Container image repository for netcat |
| initContainers.netcat.tag | string | `"latest"` | Container image tag for netcat |
| initContainers.retry | object | `{"interval":5,"maxAttempts":5}` | Retry configuration for connectivity checks |
| initContainers.retry.interval | int | `5` | Time to wait between retry attempts (in seconds) |
| initContainers.retry.maxAttempts | int | `5` | Maximum number of retry attempts for connectivity checks |
| initContainers.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"runAsUser":10001}` | Security context for init containers @schemaRef SecurityContext |
| initContainers.timeout | object | `{"connect":5,"operation":10}` | Timeout configuration for database operations |
| initContainers.timeout.connect | int | `5` | Connection timeout for database checks (in seconds) |
| initContainers.timeout.operation | int | `10` | Operation timeout for database operations (in seconds) |
| letsEncrypt.email | string | `""` | Required: The email address to use for Let's Encrypt |
| letsEncrypt.enabled | bool | `false` | Optional. Enable Let's Encrypt. |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"api"` |  |
| livenessProbe.periodSeconds | int | `60` |  |
| nameOverride | string | `""` | Override the default name |
| otelCollector | object | `{"containerSecurityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["all"]},"readOnlyRootFilesystem":true},"database":"default","enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"otel/opentelemetry-collector-contrib","tag":"0.122.1"},"livenessProbe":{"httpGet":{"path":"/","port":13133},"periodSeconds":60},"podDisruptionBudget":{"minAvailable":1},"podSecurityContext":{"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seccompProfile":{"type":"RuntimeDefault"}},"readinessProbe":{"httpGet":{"path":"/","port":13133},"periodSeconds":30},"resources":{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"500m","memory":"512Mi"}},"service":{"ports":[{"name":"otlp-grpc","port":4317,"protocol":"TCP","targetPort":4317},{"name":"otlp-http","port":4318,"protocol":"TCP","targetPort":4318}],"type":"ClusterIP"}}` | OTEL Collector configuration |
| otelCollector.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["all"]},"readOnlyRootFilesystem":true}` | Specify the container-level security context |
| otelCollector.database | string | `"default"` | Optional. The database to use for the ClickHouse exporter (should match the ClickHouse DSN) |
| otelCollector.enabled | bool | `true` | Optional. Enable the OTEL Collector. |
| otelCollector.podSecurityContext | object | `{"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seccompProfile":{"type":"RuntimeDefault"}}` | Specify the pod-level security context |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.mode | string | `"EBS"` |  |
| persistence.s3.bucketName | string | `"my-application-data"` |  |
| persistence.s3.mountOptions[0] | string | `"uid=10001"` |  |
| persistence.s3.mountOptions[1] | string | `"gid=3001"` |  |
| persistence.s3.region | string | `"us-east-1"` |  |
| persistence.size | string | `"100Gi"` |  |
| persistence.type | string | `"gp2"` |  |
| platformSecrets | object | `{"secretRef":"cq-platform-secrets"}` | Platform secrets configuration |
| platformSecrets.secretRef | string | `"cq-platform-secrets"` | Required: The secret reference to use for the user-supplied platform secrets |
| podAnnotations | object | `{}` | Addition pod annotations |
| podDisruptionBudget.minAvailable | int | `1` |  |
| podLabels | object | `{}` | Addition pod labels |
| podSecurityContext | object | `{"fsGroup":3001,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seccompProfile":{"type":"RuntimeDefault"}}` | Specify the pod-level security context |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"api"` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| replicaCount | int | `1` | The number of replicas to deploy |
| resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"500m","memory":"512Mi"}}` | Deployment resources |
| s3Source | object | `{"bucketName":"","bucketRegion":"","enabled":false,"externalId":"","iamRole":"","queueUrl":""}` | Specify the S3 source configuration |
| scheduler | object | `{"address":"scheduler-operator:3001"}` | Specify the scheduler configuration |
| service | object | `{"annotations":{},"port":3000,"targetPort":3000,"type":"ClusterIP"}` | Specify the ports the container exposes |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| testingSecret | object | `{"activationKey":"","clickhouseDSN":"","enabled":false,"postgresqlDSN":"","rudderstackBackendWriteKey":"","rudderstackFrontendWriteKey":""}` | Testing secret configuration - only used during CI/CD |
| volumeMounts | list | `[{"mountPath":"/tmp","name":"tmp"}]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[{"emptyDir":{},"name":"tmp"}]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
