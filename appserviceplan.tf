data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}

resource "azurerm_service_plan" "optimaserviceplan" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Windows" 
  sku_name            = "S1"
}

