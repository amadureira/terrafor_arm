resource "azurerm_resource_group" "example" {
  name     = "production"
  location = "West US"
}

module "networking" { 
  source = "../modules/network/"
}
