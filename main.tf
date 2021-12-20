terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "d76100e8-9e78-401e-83b2-4ab9965307f7"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "terraform-test-1" {
  name     = "terraform-test-1-rg"
  location = "east us"
}
# Create a resource group
resource "azurerm_resource_group" "terraform-test-2" {
  name     = "terraform-test-2-rg"
  location = "east us"
}

# Create a resource group
resource "azurerm_resource_group" "terraform-test-3" {
  name     = "terraform-test-3-rg"
  location = "east us"
}