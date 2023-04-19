data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}
data "azurerm_service_plan" "optimaserviceplan" {
 name = var.app_service_plan_name
}


module "webappOptima" {
  source              = "./modules/appserviceback"
  name                = "suppliers"
  resource_group_name = data.azurerm_resource_group.optima_rg.name

  depends_on = [azurerm_resource_group.optima_rg]
}
module "webappOptima" {
  source              = "./modules/appserviceback"
  name                = "companies"
  resource_group_name = data.azurerm_resource_group.optima_rg.name

  depends_on = [azurerm_resource_group.optima_rg]
}
module "webappOptima" {
  source              = "./modules/appserviceback"
  name                = "contacts"
  resource_group_name = data.azurerm_resource_group.optima_rg.name

  depends_on = [azurerm_resource_group.optima_rg]
}