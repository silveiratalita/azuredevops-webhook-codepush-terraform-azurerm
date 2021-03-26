# Criando PostgresSQL

resource "azurerm_postgresql_server" "webhookpush" {
  name                = "${var.psql_name}${lower(var.environment)}" 
  location            = azurerm_resource_group.rg_webhookpush.location
  resource_group_name = azurerm_resource_group.rg_webhookpush.name

  administrator_login          = var.psql_user
  administrator_login_password = var.psql_password

  sku_name   = var.psql_sku_name[var.environment]
  version    = var.psql_version
  storage_mb = var.psql_storage_mb[var.environment]

  backup_retention_days        = 7
  geo_redundant_backup_enabled = var.environment == "STG" ? true : false
  auto_grow_enabled            = true

  public_network_access_enabled = true
  ssl_enforcement_enabled       = false



  tags = local.tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}


resource "azurerm_postgresql_firewall_rule" "webhookpush_firewall" {
  name                = "azure"
  resource_group_name = azurerm_resource_group.rg_webhookpush.name
  server_name         = azurerm_postgresql_server.webhookpush.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_postgresql_database" "webhookpush_database" {
  name                = var.psql_database_name
  resource_group_name = azurerm_resource_group.rg_webhookpush.name
  server_name         = azurerm_postgresql_server.webhookpush.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}