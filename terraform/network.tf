#Definimos una red
resource "azurerm_virtual_network" "mired" {
    name                = "practica2red"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        environment = "CP2"
    }
}

#Definimos una subred
resource "azurerm_subnet" "misubnet" {
    name                   = "practica2subnet"
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.mired.name
    address_prefixes       = ["10.0.1.0/24"]

}

###################################################################

#Creamos network interface card con ip estática para el master
resource "azurerm_network_interface" "nicmaster" {
  name                = "nicmaster"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.misubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.ippublicamaster.id
  }

    tags = {
        environment = "CP2"
    }

}

#Creamos una IP publica para el Master
resource "azurerm_public_ip" "ippublicamaster" {
  name                = "ippublicamaster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}

####################################################################

#Creamos network interface card con ip estática para el NFS
resource "azurerm_network_interface" "nicnfs" {
  name                = "nicnfs"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.misubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.11"
    public_ip_address_id           = azurerm_public_ip.ippublicanfs.id
  }

    tags = {
        environment = "CP2"
    }

}

#Creamos una IP publica para el NFS
resource "azurerm_public_ip" "ippublicanfs" {
  name                = "ippublicanfs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}

####################################################################

#Creamos network interface card con ip estática para el WORKER
resource "azurerm_network_interface" "nicworker" {
  name                = "nicworker"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.misubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.12"
    public_ip_address_id           = azurerm_public_ip.ippublicaworker.id
  }

    tags = {
        environment = "CP2"
    }

}

#Creamos una IP publica para el NFS
resource "azurerm_public_ip" "ippublicaworker" {
  name                = "ippublicaworker"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}



