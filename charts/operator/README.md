# operator

A Helm chart for the operator that manages syncs on the CloudQuery platform

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.50.0](https://img.shields.io/badge/AppVersion-v0.50.0-informational?style=flat-square)

## Quickstart

The operator is a platform component that schedules syncs on a Kubernetes cluster.

### Default Configuration

The chart doesn't require any configuration parameters, so the easiest way to get started is by running the following commands:

```console
helm repo add cloudquery https://cloudquery.github.io/helm-charts/
helm upgrade scheduler --atomic --install -n cloudquery cloudquery/operator
```

This command ensures the operator is installed or updated to the latest version.
If something goes wrong during the deployment, it will automatically roll back any changes made to the cluster.

> [!IMPORTANT]
> While the operator can be deployed either before or after the platform, it's essential to deploy the operator before setting up integrations or running syncs.
> The operator must be connected to the platform for these actions to work.

Upon successful deployment, the command will output a message with configuration details to connect the platform installation to the scheduler.

If you're using the default configuration for both the platform and the operator, the platform pods will automatically connect to the scheduler, and you can safely ignore the message.

### Non-default configurations

However, if you're using a non-default configuration (e.g., you've deployed the components to different namespaces or changed the helm release name),
you'll need to use the config from a success message provided by helm to ensure the platform is connected to the scheduler.

The message will include a configuration snippet like the one below:

```yaml
# Add the following snippet to your Helm configuration YAML during platform installation or upgrade
# to ensure the platform can communicate with the operator:
scheduler:
  address: scheduler-operator.cloudquery:3001
```

Create a file named `scheduler.yaml` and paste the snippet into it.
Then, to install or update the platform using this configuration, supply the file to the Helm command as follows:

```console
helm upgrade --install --atomic platform -n cloudquery --create-namespace cloudquery/platform --values <platform-configs> --values ./scheduler.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Configures node affinity for the operator deployment  See https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#node-affinity. |
| environment | object | `{"SCHEDULER_K8S_LEADER_ELECTION_NAMESPACE":"","SCHEDULER_K8S_SYNC_NAMESPACE":""}` | Configures environment variables for the operator Deployment |
| environment.SCHEDULER_K8S_LEADER_ELECTION_NAMESPACE | string | `""` | The namespace to use for leader election. If not provided, will be the release namespace. |
| environment.SCHEDULER_K8S_SYNC_NAMESPACE | string | `""` | The namespace to use to spawn syncs. If not provided, will be the release namespace. |
| fullnameOverride | string | `""` | Override the full name |
| image | object | `{"pullPolicy":"IfNotPresent","pullSecrets":[],"repository":"us-east1-docker.pkg.dev/cq-cloud-prod/platform/scheduler","tag":""}` | Configures the container image for the operator Deployment. See https://kubernetes.io/docs/concepts/containers/images/. |
| image.pullPolicy | string | `"IfNotPresent"` | IfNotPresent, Always, Never |
| image.pullSecrets | list | `[]` | This sets secrets for repositories that require auth. See https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/. |
| image.repository | string | `"us-east1-docker.pkg.dev/cq-cloud-prod/platform/scheduler"` | Configures repository and registry to use when pulling a scheduler image |
| image.tag | string | `""` | Image tag to use. If empty, will use the chart's 'appVersion' |
| livenessProbe | object | `{"initialDelaySeconds":15,"periodSeconds":10,"tcpSocket":{"port":"grpc"}}` | Configures the probes for the operator deployment. See https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/. |
| nameOverride | string | `""` | Override the default name |
| nodeSelector | object | `{}` | Configures node selectors for the operator deployment  See https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector. |
| podAnnotations | object | `{}` | Configures additional labels on the operator Deployment. See https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/. |
| podLabels | object | `{}` | Configures additional labels on the operator Deployment. See https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/. |
| readinessProbe.initialDelaySeconds | int | `15` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.tcpSocket.port | string | `"grpc"` |  |
| replicaCount | int | `1` | Configures the replica count for the deployment. For out-of-cluster deployments in the dev environment, set this to zero and ignore all the sections related to the Deployment. See https://kubernetes.io/docs/concepts/workloads/controllers/deployment/. |
| resources | object | `{"limits":{"cpu":"500m","memory":"256Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | Configures resource profile for the operator deployment. See https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/. |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Configures the security context of the operator Deployment. See https://kubernetes.io/docs/tasks/configure-pod-container/security-context/. |
| service | object | `{"annotations":{},"enabled":true,"port":3001,"targetPort":"grpc","type":"ClusterIP"}` | Create a Kubernetes Service that allows gRPC connectivity to the Operator API. Needed for the CloudQuery platform deployments since the platform will use this to communicate with the scheduler. See https://kubernetes.io/docs/concepts/services-networking/service/. |
| serviceAccount | object | `{"annotations":{},"automount":true,"create":true,"name":""}` | This section builds out the service account. See https://kubernetes.io/docs/concepts/security/service-accounts/. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a service account's token in the operator pod |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Configures node tolerations for the operator deployment  See https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
