terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "container_registry_rg" {
  name     = var.container_registry_rg_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = azurerm_resource_group.container_registry_rg.name
  location                 = azurerm_resource_group.container_registry_rg.location
  sku                      = var.acr_sku
  admin_enabled            = true
}

output "acr_login_server" {
  description = "The URL of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}


