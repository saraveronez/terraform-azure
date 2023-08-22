
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "random" {

}

provider "azurerm" {
  features {

  }
}

resource "random_string" "storageaccount" {
  length  = 3
  special = false
  upper   = false
  numeric = false
}

resource "azurerm_resource_group" "rg_storage_tf" {
  name     = "rg_storage_tf"
  location = "brazilsouth"
}

resource "azurerm_storage_account" "storagetf" {
  name                     = "storagetf${random_string.storageaccount.result}"
  resource_group_name      = azurerm_resource_group.rg_storage_tf.name
  location                 = azurerm_resource_group.rg_storage_tf.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
  depends_on               = [azurerm_resource_group.rg_storage_tf]
}


resource "azurerm_storage_container" "container" {
  name                 = "terraform"
  storage_account_name = azurerm_storage_account.storagetf.name
  depends_on           = [azurerm_storage_account.storagetf]
}

output "blobstorage-name" {
  value = azurerm_storage_account.storagetf.name
}

output "blobstorage-primary-key" {
  value     = azurerm_storage_account.storagetf.primary_access_key
  sensitive = true
}

output "blobstorage-secondary-key" {
  value     = azurerm_storage_account.storagetf.secondary_access_key
  sensitive = true
}
