resource "azurerm_container_registry" "this" {
  name                    = var.name
  resource_group_name     = var.resource_group
  location                = var.location
  sku                     = var.sku
  admin_enabled           = var.admin_enabled
  zone_redundancy_enabled = var.zone_redundancy_enabled

  lifecycle {
    ignore_changes = [tags, ]
  }
}

module "diagnostic_setting" {
  source = "git::https://github.com/Noya50/hafifot-diagnosticSetting.git?ref=main"

  name                       = "${azurerm_container_registry.this.name}-diagnostic-setting-tf"
  target_resource_id         = azurerm_container_registry.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  diagnostic_setting_categories = var.diagnostic_setting_categories
}

module "hub_acr_private_endpoint" {
  source = "git::https://github.com/Noya50/hafifot-privateEndpoint.git?ref=main"

  location                       = var.location
  resource_group                 = var.resource_group
  subnet_id                      = var.subnet_id
  connected_resource_name        = var.name
  is_manual_connection           = var.private_endpoint_manual_connection
  subresource_names              = var.private_endpoint_subresource
  private_connection_resource_id = azurerm_container_registry.this.id
  depends_on                     = [azurerm_container_registry.this]
  log_analytics_workspace_id = var.log_analytics_workspace_id
}
