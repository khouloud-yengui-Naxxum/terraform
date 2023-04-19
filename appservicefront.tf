data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}
data "azurerm_service_plan" "optimaserviceplan" {
 name = var.app_service_plan_name
}


resource "azurerm_windows_web_app" "webappOptima" {
  name                = var.webappnamefront
  resource_group_name = data.azurerm_resource_group.optima_rg.name
  location            = data.azurerm_service_plan.optimaserviceplan.location
  service_plan_id     = data.azurerm_service_plan.optimaserviceplan.id
 
  site_config {
    always_on = false
    application_stack {
      node_version = "18" 
    }
  }

  
}
