variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "RG location in Azure"
}

variable "storage_account_name" {
  type        = string
  description = "storage_account_name"
}
variable "container_name_backend" {
  type        = string
  description = "container_name_backend"
}
variable "container_name_sqlDB" {
  type        = string
  description = "container_name_sqlDB"
}
variable "sql_server_name" {
  type        = string
  description = "SQL Server instance name in Azure"
}
variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan name in Azure"
}

variable "sql_admin_login" {
  type        = string
  description = "SQL Server login name in Azure"
}

variable "sql_admin_password" {
  type        = string
  description = "SQL Server password name in Azure"
}

variable "webappnameback" {
  type        = string
  description = "webappnameback"
}

variable "webappnamefront" {
  type        = string
  description = "webappnameback"
}

variable "keyvault_name" {
  type        = string
  description = "keyvault_name"
}