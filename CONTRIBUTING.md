# Contributing

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

Please don't file an issue to ask a question. You'll get faster results by reaching out to the community on our [discord channel](https://cloudquery.io/discord).

The following is a set of guidelines for contributing to this repository.

## Setting up development environment

- Install [ct](https://github.com/helm/chart-testing) (Official CLI tool for linting and testing helm charts)
- Install [helm-docs]https://github.com/norwoodj/helm-docs) for auto doc generation
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) (optional for local testing)


### Testing

```
kind create cluster
kubectl cluster-info --context kind-kind
```
