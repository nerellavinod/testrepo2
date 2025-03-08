param (
    [string]$ResourceGroupName,
    [string]$Location,
    [string]$TerraformDirectory
)

# Ensure Azure CLI is authenticated
az login
az account set --subscription "c3d246d3-988a-45ae-ba70-f7faac1e2d0a"

# Navigate to the Terraform directory
cd $TerraformDirectory

Write-Output "This text is printing2"
# Initialize Terraform
terraform init


# Import the existing resource group
terraform import azurerm_resource_group.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin

# Import the existing managed identity
terraform import azurerm_user_assigned_identity.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/$ResourceGroupName/providers/Microsoft.ManagedIdentity/userAssignedIdentities/example-identity

# Import the existing container registry
terraform import azurerm_container_registry.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/$ResourceGroupName/providers/Microsoft.ContainerRegistry/registries/testexampleregistryvin

# Import the existing storage account
terraform import azurerm_storage_account.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/$ResourceGroupName/providers/Microsoft.Storage/storageAccounts/teststorageaccount12345v


# Plan Terraform deployment
terraform plan -out=tfplan

Write-Output "This text is printing33"

az acr login --name testexampleregistryvin

# Apply Terraform deployment
terraform apply -auto-approve tfplan