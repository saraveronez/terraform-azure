resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-tf-azure"
  resource_group_name = azurerm_resource_group.rg-tf-azure.name
  location            = azurerm_resource_group.rg-tf-azure.location
  address_space       = var.vnet_address_space
  depends_on = [ azurerm_resource_group.rg-tf-azure ]
}
