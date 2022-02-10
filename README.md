# Helm Chart

This repository contains a basic Helm v3 chart that deploys CloudQuery to a Kubernetes cluster.
The Helm chart deploys a CloudQuery fetch CronJob and everything required to execute it.
The dependencies that are bundled are all optional and not enabled by default.

More documentation can be found here [docs.cloudquery.io](https://docs.cloudquery.io/docs/deployment/helm-chart)

## Install CloudQuery on a Kubernetes cluster

### Prerequisites

* system configured to access a kubernetes cluster
* [Helm v3](https://helm.sh) installed and able to access the cluster
* PostgreSQL database (>11) (e.g. self hosted, via Helm, CloudSQL, RDS, etc.)

### Download Helm Chart Dependencies

Download Helm dependencies:

```bash
helm dependencies update
```
 
### Install CloudQuery with Helm Chart

CloudQuery can be configured to run with various dependencies.

The suggested way is to use your own external database (potentially managed RDS, GCP CloudSQL) but you can also spawn together with the helm chart.

#### Installing CloudQuery without PostgreSQL

Following are the minimum steps you need to do before running `helm install`:

* Edit the `config.hcl` file to define what and how you want cloudquery to fetch the information.

In `values.yaml`:
* Update `envRenderSecret:CQ_DSN` to point to your external database.
* Add any additional envirmoent variables under `envRenderSecret` needed for CloudQuery to authenticate with your CloudProvider.
* Update `schedule` with the required scheduled you want CloudQuery to run (https://crontab.guru/).

To install just run:

```bash
helm install cloudquery .
```

You will see the following output

```text
oudquery . 
NAME: cloudquery
LAST DEPLOYED: Thu Feb 10 13:59:29 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Welcome! CloudQuery is Installed.
2. To trigger the cronjob manually run:
   kubectl create job --from=cronjob/cloudquery-cron cloudquery-cron
3. To see logs for the job run:
   kubectl logs -f jobs/cloudquery-cron
4. To exec to the admin container with cloudquery binary for debugging purposes run:
   kubectl exec -it deployment/cloudquery-admin -- /bin/sh
```

#### Installing CloudQuery with PostgreSQL

In addition to the steps defined in the previou section you need to do the following before running `helm install cloudquery .`

In `values.yaml`
* Update `postgresql.enabled` to `true`
* Under `postgresql`, update `postgresqlUsername`,  `postgresqlPassword` and `postgresqlDatabase` to your wanted values.