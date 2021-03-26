#===========ENVIRONMENT==================
variable "environment" {
  default = "$(environment)"
}
#===========LOCATION===================== 

variable "location" {
  default = {
    DEV = "eastus"
    STG = "eastus"
  }
}
#===========PREFIX==================
variable "prefix_name_webhookpush" {
  default = "webhookpush"
}

#================RESOURCE-GROUP===================
variable "resource_group_webhookpush" {
  default = "system-team"
}
#=============TAGS==================   
variable "conjunto-orcamentario" {
  default = "4130328310002495087011"
}

variable "cadeia-valor" {
  default = "POC"
}
#===================================

#============WEBAPP=================

variable "linux_fx_version" {
  default = "NODE|14-lts"
}

#variable "command_line" {
#  default = "npm start"
#}

variable "service_plan_sku_tier" {
  default = {
    DEV = "Standard"
    STG = "Standard"
  }
}

variable "service_plan_sku_size" {
  default = {
    DEV = "S1"
    STG = "S1"
  }
}
#==================================
#============PSQL=================

variable "psql_name" {
  default = "psqlwebhook" 
}

variable "psql_user" {
  default = "psqladmin"
}

variable "psql_password" {
  default = "$(psql_password)"
}

variable "psql_sku_name" {
  default = {
    DEV = "B_Gen5_2"
    STG = "B_Gen5_2"
  }
}

variable "psql_version" {
  default = "11"
}

variable "psql_storage_mb" {
  default = {
    DEV = "10240"
    STG = "10240"
  }
}
variable "psql_database_name" {
  default = "webhookpush"
  type    = string
}
#==================================

#=========KeyVault==============  qual certificado será usado.
variable "certificate_name" {
  default = {
    DEV = "krthomolog"
    STG = "krthomolog"
  }
}

variable "keyvault_name" {
  default = "webhook"   #precisamos validar qual será o keyvalt
}

variable "rg_shared" {
  default = "webhook" #precisamos validar qual será o keyvalt
}
#==================================
