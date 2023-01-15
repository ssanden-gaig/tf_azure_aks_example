terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

  cloud {
    organization = "example-org-3573a2"

    workspaces {
      name = "AzureTest2"
    }
  }
}
