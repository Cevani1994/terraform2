#VM1
resource "azurerm_virtual_network" "terraform-test-1" {
  name                = "terraform-1-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform-test-1.location
  resource_group_name = azurerm_resource_group.terraform-test-1.name
}

resource "azurerm_subnet" "terraform-test-1" {
  name                 = "terraform-1-subnet"
  resource_group_name  = azurerm_resource_group.terraform-test-1.name
  virtual_network_name = azurerm_virtual_network.terraform-test-1.name
  address_prefixes     = ["10.0.0.0/24"]
}

 resource "azurerm_public_ip" "terraform-test-1" {
   name                         = "publicIPForTerraformVM"
   location                     = azurerm_resource_group.terraform-test-1.location
   resource_group_name          = azurerm_resource_group.terraform-test-1.name
   allocation_method            = "Static"
 }

#VM2
 resource "azurerm_virtual_network" "terraform-test-2" {
  name                = "terraform-2-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform-test-2.location
  resource_group_name = azurerm_resource_group.terraform-test-2.name
}

resource "azurerm_subnet" "terraform-test-2" {
  name                 = "terraform-2-subnet"
  resource_group_name  = azurerm_resource_group.terraform-test-2.name
  virtual_network_name = azurerm_virtual_network.terraform-test-2.name
  address_prefixes     = ["10.0.0.0/24"]
}

 resource "azurerm_public_ip" "terraform-test-2" {
   name                         = "publicIPForTerraformVM"
   location                     = azurerm_resource_group.terraform-test-2.location
   resource_group_name          = azurerm_resource_group.terraform-test-2.name
   allocation_method            = "Static"
 }

 #VM3
 resource "azurerm_virtual_network" "terraform-test-3" {
  name                = "terraform-3-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform-test-3.location
  resource_group_name = azurerm_resource_group.terraform-test-3.name
}

resource "azurerm_subnet" "terraform-test-3" {
  name                 = "terraform-3-subnet"
  resource_group_name  = azurerm_resource_group.terraform-test-3.name
  virtual_network_name = azurerm_virtual_network.terraform-test-3.name
  address_prefixes     = ["10.0.0.0/24"]
}

 resource "azurerm_public_ip" "terraform-test-3" {
   name                         = "publicIPForTerraformVM"
   location                     = azurerm_resource_group.terraform-test-3.location
   resource_group_name          = azurerm_resource_group.terraform-test-3.name
   allocation_method            = "Static"
 }
