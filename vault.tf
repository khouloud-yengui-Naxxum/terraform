# administrator_login          = var.sql_admin_login
# administrator_login_password = var.sql_admin_password
data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}
data "azurerm_key_vault" "keyvaultOptima" {
   name = var.keyvault_name
}
resource "azurerm_key_vault_secret" "administrator_login" {
  name         = "sql_admin_login"
  value        = var.sql_admin_login
  key_vault_id = data.azurerm_key_vault.keyvaultOptima.id
}
resource "azurerm_key_vault_secret" "administrator_login_password" {
  name         = "sql_admin_password"
  value        = var.sql_admin_password
  key_vault_id = data.azurerm_key_vault.keyvaultOptima.id
}