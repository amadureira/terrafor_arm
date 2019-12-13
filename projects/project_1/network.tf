
data "azurerm_virtual_network" "networkname" {
       tags  {
            app = "example"
            subnet = "homolog"
       }
}

data "azurerm_subnet" "subnetname" {
  filter { 
     name = "testsubnet"
  }
  virtual_network_name = data.azurerm_virtual_network.networkname.name
}
