resource "azurerm_resource_group" "appresource" {
  name     = "test_resource_group"
  location = "West US"
}

data "azurerm_virtual_network" "networkname" {
   name = "teste-network"
   resource_group_name = "production"
   

}
data "azurerm_subnet" "subnetname" {
  filter { 
     name = "testsubnet"
  }
  virtual_network_id = data.azurerm_virtual_network.networkname.id
}

output "teste" {
  value = data.azurerm_virtual_network.networkname
}

/*
#resource "azurerm_network_interface" "interface_1" {
#  name                = "interface_1"
#  location            = "${azurerm_resource_group.appresource.location}"
#  resource_group_name = "${azurerm_resource_group.appresource.name}"
#
#  ip_configuration {
#    name                          = "testconfiguration1"
#    subnet_id                     = "${azurerm_subnet.subnetname.id}"
#    private_ip_address_allocation = "Dynamic"
#  }
#
#  tags = {
#    environment = "staging"
#  }
#}

*/
