Import-Module Az.Resources

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$resourceGroupName = Read-Host -Prompt "Enter the name of the resource group to be created"
$location = Read-Host -Prompt "Enter the location (i.e. centralus)"

# `````````````````````````````````````````````````````````````````````````````````````
Write-Host "This playbooks uses an alert trigger, therefore must be triggered manually but it can also be added as an automated response per analytic rule"
# `````````````````````````````````````````````````````````````````````````````````````
$deploymentName = "Get-VTURLPositivesComment_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VTURLPositivesComment/azuredeploy.json"
$remoteTemplate = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $remoteTemplate
    -Verbose

# `````````````````````````````````````````````````````````````````````````````````````
# The following playbooks must be attached to an automation rule for them to be used
Write-Host "The following playbooks must be attached to an automation rule for them to be used"
# `````````````````````````````````````````````````````````````````````````````````````
$deploymentName = "Get-VTDomain_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalDomainReport/incident-trigger/azuredeploy.json"
$remoteTemplate = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $remoteTemplate
    -Verbose


$deploymentName = "Get-VTFile_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalFileInfo/incident-trigger/azuredeploy.json"
$remoteTemplate = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $remoteTemplate
    -Verbose


$deploymentName = "Get-VTIPaddr_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalIPReport/incident-trigger/azuredeploy.json"
$remoteTemplate = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $remoteTemplate
    -Verbose


$deploymentName = "Get-VTURL_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalURLReport/incident-trigger/azuredeploy.json"
$remoteTemplate = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $remoteTemplate
    -Verbose

WRITE-HOST "FIX ALL REMOTE URLs TO THE LOCAL GITHUB TEMPLATES"