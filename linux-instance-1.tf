resource "azurerm_network_interface" "terraform-test-1" {
  name                = "terraform-test-1-nic"
  location            = azurerm_resource_group.terraform-test-1.location
  resource_group_name = azurerm_resource_group.terraform-test-1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform-test-1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "terraform-test-1" {
  name                = "terraform-machine-1"
  resource_group_name = azurerm_resource_group.terraform-test-1.name
  location            = azurerm_resource_group.terraform-test-1.location
  size                = "Standard_D2_v2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.terraform-test-1.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}