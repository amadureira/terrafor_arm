resource "azurerm_resource_group" "appresource" {
  name     = "test_resource_group"
  location = "West US"
}
resource "azurerm_resource_group" "networkresource" {
  name     = "production"
  location = "West US"
}
