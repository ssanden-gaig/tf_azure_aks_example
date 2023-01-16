provider "azurerm" {
  features {}
}

## Added comment
resource "random_uuid" "test" {}

locals {
  containers     = ["mydocs", "mycode", "mypics"]
  resource_group = "rg-${random_uuid.test.result}"
}

resource "azurerm_resource_group" "storage_rg" {
  location = var.location
  name     = local.resource_group
}

resource "azurerm_storage_account" "storage_acct" {
  location                 = azurerm_resource_group.storage_rg.location
  name                     = join("",["thisismytfzuretest",substr("${random_uuid.test.result}",0,8)])
  account_tier             = "Standard"
  account_replication_type = "LRS"
  resource_group_name      = azurerm_resource_group.storage_rg.name
}

resource "azurerm_storage_container" "storage_container" {
  for_each = toset(local.containers)

  storage_account_name = azurerm_storage_account.storage_acct.name
  name                 = each.value

}
