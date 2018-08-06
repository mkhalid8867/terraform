# Configure the Azure Provider
provider "azurerm" { }

# Create a resource group
resource "azurerm_resource_group" "network" {
  name     = "Mo-production"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = "production-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"

  subnet {
    name           = "Web-F"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "Data"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "Mgmt"
    address_prefix = "10.0.3.0/24"
  }
}
