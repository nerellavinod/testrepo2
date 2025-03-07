output "container_registry_login_server" {
  value = azurerm_container_registry.example.login_server
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.example.id
}

output "container_app_id" {
  value = azurerm_container_app.example.id
}

output "container_app_job_id" {
  value = azurerm_container_app_job.example.id
}