#El provider que voy a usar para terraform, será Azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

#Creo un grupo de recursos con el nombre practica_gr y el contenido de location lo obtenga de una variable var.location 
resource "azurerm_resource_group" "rg" {
    name     =  "practica2_rg"
    location = var.location

    tags = {
        environment = "CP2"
    }
}

#Creo un storage account apuntando al grupo de recursos y su location
resource "azurerm_storage_account" "staccount" {
    name                     = "staccountcp2" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}
