data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "storageOptima" { 
    name = var.storage_account_name 
    resource_group_name = data.azurerm_resource_group.optima_rg.name 
    location = data.azurerm_resource_group.optima_rg.location 
    account_tier = "Standard" 
    account_replication_type = "GRS" 
     }
resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name_backend
  storage_account_name  = azurerm_storage_account.storageOptima.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "sqlDBcontainer" {
  name                  = var.container_name_sqlDB
  storage_account_name  = azurerm_storage_account.storageOptima.name
  container_access_type = "private"
}