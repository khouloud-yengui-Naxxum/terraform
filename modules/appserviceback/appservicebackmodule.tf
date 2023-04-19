data "azurerm_resource_group" "optima_rg" {
  name = var.resource_group_name
}
data "azurerm_service_plan" "optimaserviceplan" {
 name = var.app_service_plan_name
}
data "azurerm_mssql_server" "optimaSqlDBserver" {
 name = var.sql_server_name
}
data "azurerm_mssql_database" "optimaSqlDB" {
 name = var.sql_DB_name
}

resource "azurerm_windows_web_app" "webappOptima" {
  name                = var.webappnameback
  resource_group_name = data.azurerm_resource_group.optima_rg.name
  location            = data.azurerm_service_plan.optimaserviceplan.location
  service_plan_id     = data.azurerm_service_plan.optimaserviceplan.id

  site_config {
    always_on = false
    application_stack {
      dotnet_version = "6.0" 
    }
  }

  connection_string {
    name  = "Database"
    type  = "SQLAzure"
    value = "Server=tcp:azurerm_mssql_server.optimaSqlDBserver.fully_qualified_domain_name Database=azurerm_mssql_database.optimaSqlDB.name;User ID=azurerm_mssql_server.optimaSqlDBserver.administrator_login;Password=azurerm_mssql_server.optimaSqlDBserver.administrator_login_password;Trusted_Connection=False;Encrypt=True;"
  }
}
