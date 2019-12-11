
resource "azurerm_resource_group" "example" {
  name     = "production"
  location = "West US"
}

resource "azurerm_virtual_network" "example" {
  name                = "teste-network"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.0.0.0/16"]
}

