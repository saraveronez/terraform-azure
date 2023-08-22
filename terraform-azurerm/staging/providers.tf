terraform {
 required_providers {
    random = {
      source = "hashicorp/random"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg_storage_tf"
    storage_account_name = "storagetfyqt"
    container_name       = "terraform"
    key                  = "staging/terraform"
  }
}
provider "azurerm" {
  features {
  }
}