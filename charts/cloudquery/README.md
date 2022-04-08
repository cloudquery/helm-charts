
# CloudQuery Helm Chart

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/cloudquery)](https://artifacthub.io/packages/search?repo=cloudquery)

The open-source cloud asset inventory powered by SQL.

CloudQuery extracts, transforms, and loads your cloud assets into [normalized](https://hub.cloudquery.io) PostgreSQL tables. CloudQuery enables you to assess, audit, and monitor the configurations of your cloud assets.

## Prerequisites

* [Helm V3](https://helm.sh/) installed.
* [Kubernetes 1.18+]

## Usage

```bash
helm repo add cloudquery https://cloudquery.github.io/helm-charts/
helm install cloudquery cloudquery/cloudquery --version 0.1.4
```

## Uninstall Chart

```bash
helm uninstall cloudquery
```

## Upgrading Chart

```bash
helm upgrade cloudquery cloudquery --install
```

## Configuration

The following table lists the configurable parameters of cloudquery chart and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `config` | Config.hcl to be provided for cloudquery | `0 0 * * *` |
| `schedule` | Schedule on which to run fetch | `''` |
| `envRenderSecret` | Secrets to mount as environment variable for cloudquery. Including database URI, and authentication tokens | `{}` |
| `image.registry` | Image repository | `ghcr.io` |
| `image.repository` | Image repository | `cloudquery/cloudquery` |
| `image.tag` | Image tag | `{{RELEASE_VERSION}}` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `serviceAccount.create` | If `true`, create a new service account | `true` |
| `serviceAccount.name` | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template |  |
| `serviceAccount.annotations` | Annotations to add to the service account |  |
| `serviceAccount.automountServiceAccountToken` | Automount API credentials for the Service Account | `true` |
