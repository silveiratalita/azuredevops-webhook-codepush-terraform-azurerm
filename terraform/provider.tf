terraform {
  backend "azurerm" {
    resource_group_name  = "system-team"
    storage_account_name = "$(backend_storage)"
    container_name       = "tfstate"
    key                  = "backend_path"

    access_key = "backend_access_key"
  }

}


provider "azurerm" {
  features {

  }
}
