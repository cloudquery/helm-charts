# Terraform GKE example

This is an example reference on how to spawn a zonal GKE cluster to run CloudQuery on.

You can use it as it or fine-tune it to your needs. Also, if you already have a k8s cluster running you can use the helm straight away.

## Running

```
terraform init
terraform apply

gcloud container clusters get-credentials cloudquery
cd ../..
helm install cloudquery .
```