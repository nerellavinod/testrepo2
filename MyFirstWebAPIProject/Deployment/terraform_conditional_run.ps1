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

# Plan Terraform deployment
terraform plan -out=tfplan

Write-Output "This text is printing33"

# Apply Terraform deployment
terraform apply -auto-approve tfplan