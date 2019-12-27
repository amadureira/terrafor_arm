terraform {
  backend "azurerm" {
    resource_group_name  = "RG_prd_CC_abc_abc"
    storage_account_name = "asdfasdfsss"
    container_name       = "${var.workspace_name}"
    key                  = "prod.terraform.tfstate"
  }
}
