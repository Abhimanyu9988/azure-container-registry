resource "azurerm_container_group" "container_group" {
    name      = var.container_group_name 
    location            = var.location
    resource_group_name = azurerm_resource_group.container_registry_rg.name
    os_type             = "Linux"

    container {
        name   = "java-application"
        image  = "${azurerm_container_registry.acr.login_server}/${var.repo_name}:latest"
        cpu    = "0.5"
        memory = "1.5"

        ports {
            port     = 8080
            protocol = "TCP"
        }
    }

    image_registry_credential {
        server   = azurerm_container_registry.acr.login_server
        username = azurerm_container_registry.acr.admin_username
        password = azurerm_container_registry.acr.admin_password
    }
    restart_policy = "OnFailure"
}
