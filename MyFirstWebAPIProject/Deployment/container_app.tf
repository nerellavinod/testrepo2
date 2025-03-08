resource "azurerm_user_assigned_identity" "example" {
  name                = "example-identity"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

resource "azurerm_container_app" "example" {
  name                = var.container_app_name
  resource_group_name = azurerm_resource_group.example.name
  container_app_environment_id = azurerm_container_app_environment.example.id
  revision_mode       = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.example.id]
  }

  template {
    container {
      name   = "example-container"
      image  = "${azurerm_container_registry.example.login_server}/mycontainerapp:latest"
      cpu    = 0.5
      memory = "1.0Gi"
    }
  }
}

resource "azurerm_role_assignment" "example" {
  principal_id         = "2fcaebff-c565-49b9-905c-17b3f095ee21"
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.example.id
}