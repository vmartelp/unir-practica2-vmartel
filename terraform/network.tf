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

#Creamos network interface card con ip estática
resource "azurerm_network_interface" "minic1" {
  name                = "vmnic1"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.misubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.mipublicip1.id
  }

    tags = {
        environment = "CP2"
    }

}



#Creamos una IP publica para poder acceder desde fuera de azure

resource "azurerm_public_ip" "mipublicip1" {
  name                = "vmip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}






