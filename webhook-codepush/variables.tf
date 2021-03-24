#===========ENVIRONMENT==================
variable "environment" {
  default = "$(environment)"
}
#===========LOCATION===================== Onde deverá ser hospedado a aplicação? Deverá ter mais de um ambiente?

variable "location" {
  default = {
    DEV = "eastus"
    STG = "eastus"
    PRD = "brazilsouth"
  }
}
#===========PREFIX==================
variable "prefix_name_webhookpush" {
  default = "webhookpush"
}

#===================================

#=============TAGS==================    Perguntar sobre as tags desse projeto
variable "conjunto-orcamentario" {
  default = "4130328310002495087011"
}

variable "cadeia-valor" {
  default = "Consultoria Educacao"
}
#===================================

#============WEBAPP=================

variable "linux_fx_version" {
  default = "NODE|14-lts"
}

variable "command_line" {
  default = "npm start"
}

variable "service_plan_sku_tier" {
  default = {
    DEV = "Standard"
    STG = "Standard"
    PRD = "Standard"
  }
}

variable "service_plan_sku_size" {
  default = {
    DEV = "S1"
    STG = "S1"
    PRD = "S1"
  }
}
#==================================
#============PSQL=================

variable "psql_name" {
  default = "psqlconsultoriaeducacao" #Utiliza um banco existente ou cria um novo?
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
    PRD = "GP_Gen5_2"
  }
}

variable "psql_version" {
  default = "11"
}

variable "psql_storage_mb" {
  default = {
    DEV = "10000"
    STG = "10000"
    PRD = "102400"
  }
}
variable "psql_database_name" {
  default = "webhookpush"
  type    = string
}
#==================================

#=========KeyVault============== Entender sobre os ambientes (se necessário), e qual certificado será usado.
variable "certificate_name" {
  default = {
    DEV = "krthomolog"
    STG = "krthomolog"
    PRD = "webhookpush"
  }
}

variable "keyvault_name" {
  default = "key-shared-conedu"
}

variable "rg_shared" {
  default = "CONSULTORIA-EDUCACAO-SHARED"
}
#==================================
