provider "azurerm" {
    features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.52.0"
    }
  }
}

resource "azurerm_resource_group" "optima_rg" {
  provider = azurerm.subscription_optima
  name     = var.resource_group_name
  location = var.resource_group_location
}