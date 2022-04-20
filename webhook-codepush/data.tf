data "azurerm_key_vault" "keyvault_shared" {
  name                = "${var.keyvault_name}-${lower(var.environment)}"
  resource_group_name = "${var.rg_shared}-${var.environment}"
}



data "azurerm_key_vault_certificate" "keyvault_certificate" {
  name         = var.certificate_name[var.environment]
  key_vault_id = data.azurerm_key_vault.keyvault_shared.id
}