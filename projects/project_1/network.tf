
data "azurerm_virtual_network" "networkname" {
   name = "teste-network"
   resource_group_name = "${azurerm_resource_group.networkresource.name}"
   depends_on = [ 
      azurerm_resource_group.appresource
   ] 
  lifecycle { 
    prevent_destroy =  true
  }
}

data "azurerm_subnet" "subnetname" {
  name                 =  "testsubnet"
  virtual_network_name =  data.azurerm_virtual_network.networkname.name
  resource_group_name = "${azurerm_resource_group.networkresource.name}"
   depends_on = [ 
    data.azurerm_virtual_network.networkname
   ]
  lifecycle { 
    prevent_destroy =  true
  }
}


resource "azurerm_network_interface" "interface1" {
  name                = "interface1"
  location            = "${azurerm_resource_group.appresource.location}"
  resource_group_name = "${azurerm_resource_group.appresource.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnetname.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [ 
   data.azurerm_subnet.subnetname
  ]
  tags = {
    environment = "staging"
  }
}
