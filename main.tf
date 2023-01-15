
provider "azurerm" {
  features {}
    }

resource "random_uuid" "test" {}

locals {
    containers = ["mydocs","mycode","mypics"]
    resource_group="${random_uuid.test.result}-rg" 
}


resource "azurerm_resource_group" "storage_rg" {
 location = var.location
 name = local.resource_group 
}

resource "azurerm_storage_account" "storage_acct" {
 location = azurerm_resource_group.storage_rg.location
 name = var.storage_acct_name
 account_tier = "Standard"
 account_replication_type = "LRS"
 resource_group_name=azurerm_resource_group.storage_rg.name
}

resource "azurerm_storage_container" "storage_container" {
  for_each = toset(local.containers)  
  
  storage_account_name = azurerm_storage_account.storage_acct.name
  name= "${each.value}"

}
