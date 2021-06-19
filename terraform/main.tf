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
resource "azurerm_resource_group" "practica_gr" {
    name     =  "practica_gr"
    location = var.location

    tags = {
        environment = "CP2"
    }
}
