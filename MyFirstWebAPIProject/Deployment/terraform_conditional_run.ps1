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
terraform import azurerm_user_assigned_identity.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin/providers/Microsoft.ManagedIdentity/userAssignedIdentities/example-identity

# Import the existing container registry
terraform import azurerm_container_registry.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin/providers/Microsoft.ContainerRegistry/registries/testexampleregistryvin

# Import the existing storage account
terraform import azurerm_storage_account.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin/providers/Microsoft.Storage/storageAccounts/teststorageaccount12345v

# Import the existing container app environment
terraform import azurerm_container_app_environment.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin/providers/Microsoft.App/managedEnvironments/test-example-environmentvin

# Import the existing role assignment
#terraform import azurerm_role_assignment.example /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin/providers/Microsoft.Authorization/roleAssignments/9b254276-49b6-4e8d-89fe-35090577b7e3

# Import the existing role assignment
#terraform import azurerm_role_assignment.acr_pull /subscriptions/c3d246d3-988a-45ae-ba70-f7faac1e2d0a/resourceGroups/testexample-resources-vin/providers/Microsoft.Authorization/roleAssignments/9b254276-49b6-4e8d-89fe-35090577b7e3


# Plan Terraform deployment
terraform plan -out=tfplan

if ($LASTEXITCODE -ne 0) {
    Write-Error "Terraform plan failed"
    exit $LASTEXITCODE
}

Write-Output "This text is printing33"

az acr login --name testexampleregistryvin

# Apply Terraform deployment
terraform apply -auto-approve tfplan

if ($LASTEXITCODE -ne 0) {
    Write-Error "Terraform apply failed"
    exit $LASTEXITCODE
}

Write-Output "This text is printing after apply"