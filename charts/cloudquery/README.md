# cloudquery

![Version: 38.2.4](https://img.shields.io/badge/Version-38.2.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.25.1](https://img.shields.io/badge/AppVersion-6.25.1-informational?style=flat-square)

Open source high performance data integration platform designed for security and infrastructure teams.

**Homepage:** <https://cloudquery.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| yevgenypats | <yp@cloudquery.io> |  |

## Source Code

* <https://github.com/cloudquery/helm-charts/tree/main/charts/cloudquery>

## Requirements

Kubernetes: `^1.8.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | promtail | 6.17.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.enabled | bool | `true` | Enable admin container useful for debugging into cloudquery |
| annotations | object | `{}` | Optional. Additional annotations to be applied to all resources. |
| config | string | The chart will use a default CloudQuery aws config | CloudQuery cloudquery.yml content |
| containerSecurityContext | object | See [values.yaml](./values.yaml) | Container security context |
| cronJobAdditionalArgs | list | `[]` | Optional. Additional CLI arguments to pass to the scheduled sync job (e.g. setting log format) More information at: https://www.cloudquery.io/docs/reference/cli/cloudquery |
| cronJobFailedJobsLimit | int | `1` | Number of failed cronjobs to retain. |
| cronJobLimit | int | `3` | Number of successful cronjobs to retain. |
| cronJobPodAnnotations | object | `{}` | Optional. CronJob Pod annotations. |
| cronJobPodLabels | object | `{}` | Optional. CronJob Pod labels. |
| cronJobSuspend | bool | `false` | Optional. Disable the execution of the Cronjob |
| cronJobTTLSecondsAfterFinished | int | `259200` | How long to retain the job created by cron after it has finished. Default is 259200 seconds (3 days). |
| deploymentAnnotations | object | `{}` | Optional. Admin Deployment annotations. |
| envRenderSecret | object | `{}` | Sensible environment variables that will be rendered as new secret object This can be useful for auth tokens, etc Make sure not to commit sensitive values to git!! Better use AWS Secret manager (or any other) |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"cloudquery/cloudquery"` |  |
| image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion |
| job.enabled | bool | `false` | Create a job that runs once upon installation. |
| job.ttlSecondsAfterFinished | int | `259200` | How long to retain the job after it has finished. Default is 259200 seconds (3 days). |
| labels | object | `{}` | Optional. Additional labels to be applied to all resources. |
| nameOverride | string | `""` | Partially override common.names.fullname template (will maintain the release name) |
| nodeSelector | object | `{}` | Optional. Adds the nodeSelector to the admin pod and cronjob. |
| promtail | object | See [values.yaml](./values.yaml) | Promtail sub-chart configuration |
| resources.admin | object | `{"requests":{"cpu":"1000m","memory":"1024Mi"}}` | Optional. Resource requests/ limit for admin pod. |
| resources.cronJob | object | `{"requests":{"cpu":"1000m","memory":"1024Mi"}}` | Optional. Resource requests/ limit for cronJob. |
| schedule | string | `"0 */6 * * *"` | Schedule fetch time Every 6 hours. More information at: https://crontab.guru/#0_0_*_*_* |
| secretRef | string | `nil` | Reference to an external secret that contains sensible environment variables This option is useful to avoid store sensitive values in Git. You need to create the secret manually and reference it. If secretRef is used, the envRenderSecret parameter will be omitted (in case that it has content). |
| securityContext | object | `{"fsGroup":1001}` | Pod security context |
| serviceAccount.annotations | object | `{}` | Additional custom annotations for the ServiceAccount to associate an AWS IAM role with service-account you need to add the following annotations. For more info checkout: https://docs.aws.amazon.com/eks/latest/userguide/specify-service-account-role.html eks.amazonaws.com/role-arn: arn:aws:iam::ACCOUNT_ID:role/ROLE |
| serviceAccount.autoMount | bool | `false` | Auto-mount the service account token in the pod |
| serviceAccount.enabled | bool | `false` | Enable service account (Note: Service Account will only be automatically created if `serviceAccount.name` is not set) |
| serviceAccount.labels | object | `{}` | Additional custom label for the ServiceAccount |
| serviceAccount.name | string | `""` | Name of an already existing service account. Setting this value disables the automatic service account creation |
| tplConfig | bool | `false` | Pass the configuration directives and envRenderSecret through Helm's templating engine. # ref: https://helm.sh/docs/developing_charts/#using-the-tpl-function |
| volumeMounts | string | `nil` |  |
| volumes | string | `nil` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
