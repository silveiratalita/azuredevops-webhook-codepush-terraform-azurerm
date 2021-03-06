resource "azurerm_app_service_plan" "service_plan_webhookpush" {
  name                = "service-plan-${(var.prefix_name_webhookpush)}-${(var.environment)}"
  location            = data.azurerm_resource_group.system-team.location
  resource_group_name = data.azurerm_resource_group.system-team.name
  kind                = "Linux"
  reserved            = true
  tags                = local.tags


  sku {
    tier = var.service_plan_sku_tier[var.environment]
    size = var.service_plan_sku_size[var.environment]
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

}

resource "azurerm_app_service" "webapp_webhookpush" {

  name = var.environment == "STG" ? "${(var.prefix_name_webhookpush)}" : "${(var.prefix_name_webhookpush)}${(var.environment)}"

  location            = data.azurerm_resource_group.system-team.location
  resource_group_name = data.azurerm_resource_group.system-team.name
  app_service_plan_id = azurerm_app_service_plan.service_plan_webhookpush.id
  https_only          = true
  tags                = local.tags
  site_config {
    linux_fx_version = var.linux_fx_version
    #  app_command_line = var.command_line
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

}

# resource "azurerm_app_service_certificate" "cert" {
#   name                = var.certificate_name[var.environment]
#   location            = azurerm_resource_group.system-team.location
#   resource_group_name = azurerm_resource_group.system-team.name
#   key_vault_secret_id = data.azurerm_key_vault_certificate.keyvault_certificate.secret_id
#   tags                = local.tags
#   depends_on          = [azurerm_app_service.webapp_webhookpush]

#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#   }
# }


