#
#data "azurerm_virtual_network" "networkname" {
#   name = "teste-network"
#   resource_group_name = "${azurerm_resource_group.networkresource.name}"
#
#}

data "azurerm_subnet" "subnetname" {
  name                 =  "testsubnet"
  virtual_network_name =  "teste-network"
  resource_group_name = "${azurerm_resource_group.networkresource.name}"

}


resource "azurerm_network_interface" "interface1" {
  count               = "{interface_cout}"
  name                = "${var.interface_name}-${count.index}"
  location            = "${azurerm_resource_group.appresource.location}"
  resource_group_name = "${azurerm_resource_group.appresource.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnetname.id
    private_ip_address_allocation = "Dynamic"
  }
# depends_on = [ 
#  data.azurerm_subnet.subnetname
# ]
  tags = {
    environment = "staging"
  }
}
