resource "azurerm_network_security_group" "nsg" {
  name                = "tf_nsg"
  location            = azurerm_resource_group.rg_tf_azure.location
  resource_group_name = azurerm_resource_group.rg_tf_azure.name
  depends_on          = [azurerm_resource_group.rg_tf_azure]
}

resource "azurerm_network_security_rule" "nsgr_input" {
  for_each                    = var.ports
  resource_group_name         = azurerm_resource_group.rg_tf_azure.name
  name                        = "portinbound${each.value}"
  priority                    = each.key
  destination_port_range      = each.value
  direction                   = "Inbound"
  access                      = "Allow"
  source_port_range           = "*"
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg.name
  depends_on                  = [azurerm_network_security_group.nsg]
}
