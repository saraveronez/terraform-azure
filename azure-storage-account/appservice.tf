resource "azurerm_service_plan" "service_plan" {
  name                = "app_service_plan"
  resource_group_name = azurerm_resource_group.rg-tf-azure.name
  location            = azurerm_resource_group.rg-tf-azure.location
  os_type             = "Linux"
  sku_name            = "F1"
  depends_on = [ azurerm_resource_group.rg-tf-azure ]
}


resource "azurerm_linux_web_app" "app_service" {
  name                = "appservice"
  resource_group_name = azurerm_resource_group.rg-tf-azure.name
  location            = azurerm_resource_group.rg-tf-azure.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  depends_on = [ azurerm_service_plan.service_plan ]

  site_config {}
}