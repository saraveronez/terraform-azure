resource "azurerm_resource_group" "rg-tf-azure" {
  name     = var.rg-name
  location = var.location
  tags     = merge(local.tags, { training = "terraform-training" })
}