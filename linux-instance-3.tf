resource "azurerm_network_interface" "terraform-test-3" {
  name                = "terraform-test-3-nic"
  location            = azurerm_resource_group.terraform-test-3.location
  resource_group_name = azurerm_resource_group.terraform-test-3.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform-test-3.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "terraform-test-3" {
  name                = "terraform-machine-3"
  resource_group_name = azurerm_resource_group.terraform-test-3.name
  location            = azurerm_resource_group.terraform-test-3.location
  size                = "Standard_D2_v2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.terraform-test-3.id,
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