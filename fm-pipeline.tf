locals {
  profiles_id  = data.grafana_cloud_stack.stack.profiles_user_id
  profiles_url = data.grafana_cloud_stack.stack.profiles_url
}

resource "grafana_fleet_management_pipeline" "pipeline" {
  provider = grafana.fm

  name = "profiling"
  contents = templatefile(
    "profiling.alloy.tftpl",
    {
      profiles_id  = local.profiles_id,
      profiles_url = local.profiles_url,
    },
  )
  matchers = [
    "env=\"PROD\""
  ]
  enabled = true
}
