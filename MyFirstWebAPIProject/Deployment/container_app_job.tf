resource "azurerm_container_app_job" "example" {
  name                = "test-example-jobvin"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  container_app_environment_id = azurerm_container_app_environment.example.id
  replica_timeout_in_seconds   = 60

  manual_trigger_config {
    parallelism = 1
  }

  template {
    container {
      name   = "example-job-container"
      image  = "testexampleregistryvin.azurecr.io/mycontainerapp:latest"
      cpu    = 0.5
      memory = "1.0Gi"
    }
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = "2fcaebff-c565-49b9-905c-17b3f095ee21"
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.example.id
}