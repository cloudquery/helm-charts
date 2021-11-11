Create values file:

```yaml
# override.yaml

cloudquery:
  config: |-
    cloudquery {
      plugin_directory = "./cq/providers"

      provider "aws" {
        source  = ""
        version = "latest"
      }

      connection {
        dsn = "host=localhost user=postgres password=pass database=postgres port=5432 sslmode=disable"
      }
    }

    provider "aws" {
      configuration {
        // Optional. Enable AWS SDK debug logging.
      }

      // list of resources to fetch
      resources = [
        "ec2.instances",
      ]
      // enables partial fetching, allowing for any failures to not stop full resource pull
      enable_partial_fetch = true
    }
  env: {}
  secret:
    AWS_ACCESS_KEY_ID: XYZ
    AWS_SECRET_ACCESS_KEY: xyz
```

Run helm installation:

`helm install -f override.yaml cloudquery .`