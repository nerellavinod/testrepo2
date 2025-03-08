
variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
  default     = "c3d246d3-988a-45ae-ba70-f7faac1e2d0a"
}

variable "tenant_id" {
  description = "The tenant ID for Azure"
  type        = string
  default     =  "add1c500-a6d7-4dbd-b890-7f8cb6f7d861"
}
variable "client_id" {
  description = "The Client ID for Azure"
  type        = string
  default     = "03630243-5762-4f96-b895-ab4c6246d4ba"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "testexample-resources-vin"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "West Europe"
}

variable "container_registry_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "testexampleregistryvin"
}

variable "container_app_environment_name" {
  description = "The name of the Azure Container App Environment"
  type        = string
  default     = "test-example-environmentvin"
}

variable "container_app_name" {
  description = "The name of the Azure Container App"
  type        = string
  default     = "test-example-appvin"
}

variable "container_app_job_name" {
  description = "The name of the Azure Container App Job"
  type        = string
  default     = "test-example-jobvin"
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "teststorageaccount12345v"
}