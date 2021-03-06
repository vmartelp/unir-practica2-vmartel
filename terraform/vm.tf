# Creamos una máquina virtual MASTER con Centos 8 Stream
resource "azurerm_linux_virtual_machine" "kubernetes-master" {
    name                = "kubernetes-master"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size_master
    admin_username      = "master"
    network_interface_ids = [ azurerm_network_interface.nicmaster.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "master"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.unirvictorstorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}

########################################################################

# Creamos una máquina virtual NFS con Centos 8 Stream
resource "azurerm_linux_virtual_machine" "kubernetes-NFS" {
    name                = "kubernetes-NFS"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = "nfs"
    network_interface_ids = [ azurerm_network_interface.nicnfs.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "nfs"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.unirvictorstorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}

##########################################################################

# Creamos una máquina virtual WORKER con Centos 8 Stream
resource "azurerm_linux_virtual_machine" "kubernetes-worker" {
    name                = "kubernetes-worker"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = "worker"
    network_interface_ids = [ azurerm_network_interface.nicworker.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "worker"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.unirvictorstorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}
