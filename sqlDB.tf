data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}
data "azurerm_storage_account" "storageOptima" {
  name = var.storage_account_name
}
data "azurerm_key_vault_secret" "administrator_login" {
}
data "azurerm_key_vault_secret" "administrator_login_password" {
}
 
 

resource "azurerm_mssql_server" "optimaSqlDBserver" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.optima_rg.name
  location                     = azurerm_resource_group.optima_rg.location
  version                      = "12.0"
  # administrator_login          = var.sql_admin_login
  # administrator_login_password = var.sql_admin_password
  administrator_login          = data.azurerm_key_vault_secret.administrator_login.value
  administrator_login_password = data.azurerm_key_vault_secret.administrator_login_password.value
}

resource "azurerm_mssql_database" "optimaSqlDB" {
  name           = var.sql_DB_name
  server_id      = azurerm_mssql_server.optimaSqlDBserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

}
resource "azurerm_mssql_database_extended_auditing_policy" "policy" {
  database_id                             = azurerm_mssql_database.optimaSqlDB.id
  storage_endpoint                        = azurerm_storage_account.storageOptima.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.storageOptima.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 1
}