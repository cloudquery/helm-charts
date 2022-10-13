# Contributing

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

Please don't file an issue to ask a question. You'll get faster results by reaching out to the community on our [discord channel](https://cloudquery.io/discord).

The following is a set of guidelines for contributing to this repository.

## Setting up development environment

- Install [ct](https://github.com/helm/chart-testing) (Official CLI tool for linting and testing helm charts)
- Install [helm-docs]https://github.com/norwoodj/helm-docs) for auto doc generation
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) (optional for local testing)

## Usage

```bash
# Setup cluster
kind create cluster
# Install chart (default is to use the AWS plugin)
helm install cloudquery ./charts/cloudquery/ -f ./charts/cloudquery/values.yaml \
    # These environment variables should be exported before running the command
    --set envRenderSecret.CQ_DSN=$CQ_DSN \
    --set envRenderSecret.AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    --set envRenderSecret.AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    --set envRenderSecret.AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN
# Trigger cron job
kubectl create job --from=cronjob/cloudquery-cron cloudquery-cron -n default
# Get cron job logs
kubectl logs -f jobs/cloudquery-cron -n default
# Cleanup cluster
kind delete cluster
```
