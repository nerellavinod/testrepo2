param (
    [string]$ResourceGroupName,
    [string]$Location,
    [string]$TerraformDirectory
  )

# Ensure the required parameters are provided
if (-not $ResourceGroupName -or -not $Location -or -not $TerraformDirectory) {
    Write-Error "ResourceGroupName, Location, and TerraformDirectory parameters are required."
    exit 1
}

# Login to Azure
az login --service-principal -u $env:ARM_CLIENT_ID -p $env:ARM_CLIENT_SECRET --tenant $env:ARM_TENANT_ID

# Set the subscription
az account set --subscription $env:ARM_SUBSCRIPTION_ID

# Navigate to the Terraform directory
cd $TerraformDirectory

# Initialize Terraform
terraform init

# Plan Terraform deployment
terraform plan -out=tfplan

# Apply Terraform deployment
#terraform apply tfplan