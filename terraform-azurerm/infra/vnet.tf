resource "azurerm_virtual_network" "vnet" {
  name                = "vnet_tf_azure"
  resource_group_name = azurerm_resource_group.rg_tf_azure.name
  location            = azurerm_resource_group.rg_tf_azure.location
  address_space       = var.vnet_address_space
  depends_on = [ azurerm_resource_group.rg_tf_azure ]
}
