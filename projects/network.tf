

resource "azurerm_virtual_network" "example" {
  name                = "teste-network"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "example" {
  name = "testsubnet"
  resource_group_name  = "${azurerm_resource_group.example.name}" 
  virtual_network_name = "teste-network"
  address_prefix = "10.0.1.0/24"
}
