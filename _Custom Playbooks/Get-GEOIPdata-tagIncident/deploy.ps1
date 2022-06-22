Import-Module Az.Resources

# Connect to Azure account
Connect-AzAccount

# Set the correct subscription
Set-AzContext "8a4240ce-134d-4afc-9fdd-f598c7783fc5"

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$resourceGroupName = 'RG-BH-Playbooks'
$location = 'eastus'

if ($resourceGroupName -eq '') {
    $resourceGroupName = Read-Host -Prompt "Enter the name of the resource group to be created"
}

if ($location -eq '') {
    $location = Read-Host -Prompt "Enter the location (i.e. centralus)"
}

#  local deploys
$TemplateFile = 'template.json'
$ParameterFile = 'parameters.json'
$deploymentName = "get-geoIP" + $deploySuffix
New-AzResourceGroupDeployment -Name $deploymentName `
 -ResourceGroupName $myRg `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Verbose


# # remote deploys
# $deploymentName = "basename_" + $deploySuffix
# $remoteUrl = ""
# $remoteTemplate = ''
# New-AzResourceGroupDeployment -Name $deploymentName `
#     -ResourceGroupName $myRg `
#     -TemplateUri $remoteUrl `
#     -TemplateParameterFile $remoteTemplate
#     -Verbose


    
# # USE FOR LOCAL TEMPLATE DEPLOYS
# # New-AzResourceGroupDeployment -ResourceGroupName $myRg `
# #  -TemplateFile $TemplateFile `
# #  -TemplateParameterFile $ParameterFile `
# #  -Name $deploymentName `
# #  -Verbose
