resource "azurerm_application_insights" "webhookpush_application_insights" {
  name                = var.environment == "PRD" ? "${(var.prefix_name_webhookpush)}" : "${(var.prefix_name_webhookpush)}${lower(var.environment)}"
  location            = azurerm_resource_group.rg_webhookpush.location
  resource_group_name = azurerm_resource_group.rg_webhookpush.name
  application_type    = "Node.JS"
  tags                = local.tags
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

output "instrumentation_key" {
  value = azurerm_application_insights.webhookpush_application_insights.instrumentation_key
}
output "connection_string" {
  value = azurerm_application_insights.webhookpush_application_insights.connection_string
}

output "app_id" {
  value = azurerm_application_insights.webhookpush_application_insights.app_id
}