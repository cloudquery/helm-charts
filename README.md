Create values file:

```yaml
# override.yaml

# Required CloudQuery config.
config:
  # CloudQuery config.hcl content.
  cloudquery: |-
    cloudquery {
      plugin_directory = "./cq/providers"

      provider "aws" {
        source  = ""
        // Use environment variable from block below.
        version = "${AWS_VERSION}"
      }
    }

    provider "aws" {
      configuration {
        // Optional. Enable AWS SDK debug logging.
        aws_debug = false
      }

      // list of resources to fetch
      resources = [
        "ec2.instances",
      ]
      // enables partial fetching, allowing for any failures to not stop full resource pull
      enable_partial_fetch = true
    }
  # The connection block specifies to which database you should connect via dsn argument.
  dsn: "host=postgres.svc.cluster.local user=postgres password=pass database=postgres port=5432 sslmode=disable"
  # Environment variables for CloudQuery run. 
  env:
    CQ_VAR_AWS_VERSION: "latest"
  # Secret environment variables for CloudQuery run.
  secret:
    AWS_ACCESS_KEY_ID: "AKIAIOSFODNN7EXAMPLE"
    AWS_SECRET_ACCESS_KEY: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

# Every day at 00:00.
# More information at: https://crontab.guru/#0_0_*_*_*
schedule: "0 0 * * *"
```

Run helm installation:

`helm install -f override.yaml cloudquery .`
