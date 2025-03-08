resource "azurerm_container_app_job" "example" {
  name                = var.container_app_job_name
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
     image  = "${azurerm_container_registry.example.testexampleregistryvin.azurecr.io}/mycontainerapp:latest"
      cpu    = 0.5
      memory = "1.0Gi"
    }
  }
}