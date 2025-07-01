resource "local_file" "alloy_config" {
  filename = "<ALLOY_CONFIG_PATH>"
  content = templatefile(
    "config.alloy.tftpl",
    {
      collector_id = "prod_collector",
      fm_id        = local.fm_id,
      fm_url       = local.fm_url,
    },
  )
  directory_permission = "0644"
  file_permission      = "0644"
}
