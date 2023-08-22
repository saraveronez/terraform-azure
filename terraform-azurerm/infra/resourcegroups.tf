resource "azurerm_resource_group" "rg_tf_azure" {
  name     = "${var.rg_name}_${var.environment}"
  location = var.location
  tags     = merge(local.tags, { training = "terraform-training" })
}