Import-Module Az.Resources

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$resourceGroupName = ''
$location = ''

if ($resourceGroupName -eq '') {
    $resourceGroupName = Read-Host -Prompt "Enter the name of the resource group to be created"
}

if ($location -eq '') {
    $location = Read-Host -Prompt "Enter the location (i.e. centralus)"
}


$playbookName = "Get-VTURLPositivesComment"
$TemplateFile = $playbookName + '\' + "$playbookName.json"
$ParameterFile = $playbookName + '\' + "$playbookName.parameters.json"
$deploymentName = $playbookName + $deploySuffix

New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Verbose


$playbookName = "Get-VirusTotalURLReport"
$TemplateFile = $playbookName + '\' + "$playbookName.json"
$ParameterFile = $playbookName + '\' + "$playbookName.parameters.json"
$deploymentName = $playbookName + $deploySuffix

New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Verbose

$playbookName = "Get-VirusTotalIPReport"
$TemplateFile = $playbookName + '\' + "$playbookName.json"
$ParameterFile = $playbookName + '\' + "$playbookName.parameters.json"
$deploymentName = $playbookName + $deploySuffix

New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Verbose


$playbookName = "Get-VirusTotalFileInfo"
$TemplateFile = $playbookName + '\' + "$playbookName.json"
$ParameterFile = $playbookName + '\' + "$playbookName.parameters.json"
$deploymentName = $playbookName + $deploySuffix

New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Verbose


$playbookName = "Get-VirusTotalDomainReport"
$TemplateFile = $playbookName + '\' + "$playbookName.json"
$ParameterFile = $playbookName + '\' + "$playbookName.parameters.json"
$deploymentName = $playbookName + $deploySuffix

New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Verbose