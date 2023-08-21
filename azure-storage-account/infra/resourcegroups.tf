resource "azurerm_resource_group" "rg-tf-azure" {
  name     = "${var.rg-name}${var.environment}"
  location = var.location
  tags     = merge(local.tags, { training = "terraform-training" })
}