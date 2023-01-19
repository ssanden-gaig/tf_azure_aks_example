provider "azurerm" {
  features {}
}

## Added comment
resource "random_uuid" "test" {}

locals {
  #containers     = ["mydocs", "mycode", "mypics"]
  resource_group = "${var.resource_group_name}-${random_uuid.test.result}"
}

resource "azurerm_resource_group" "storage_resource_group" {
  location = var.location
  name     = local.resource_group
}


module "storage_account" {
  source = "git::https://github.com/ssanden-gaig/tf-azure-modules.git//storage"

  resource_group_name = azurerm_resource_group.storage_resource_group.name 
  storage_account_name=var.storage_account_name
  container_name=var.container_name
}

# resource "azurerm_storage_account" "storage_acct" {
#   location                 = azurerm_resource_group.storage_rg.location
#   name                     = join("",["mystaccttf",substr("${random_uuid.test.result}",0,8)])
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   resource_group_name      = azurerm_resource_group.storage_rg.name
# }

# resource "azurerm_storage_container" "storage_container" {
#   for_each = toset(local.containers)

#   storage_account_name = azurerm_storage_account.storage_acct.name
#   name                 = each.value

# }
