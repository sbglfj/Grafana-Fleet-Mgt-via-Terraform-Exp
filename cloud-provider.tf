terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.19.0"
    }
  }
}

provider "grafana" {
  alias = "cloud"

  cloud_access_policy_token = "<CLOUD_ACCESS_POLICY_TOKEN>"
}

data "grafana_cloud_stack" "stack" {
  provider = grafana.cloud

  slug = "sbglfj"
}
