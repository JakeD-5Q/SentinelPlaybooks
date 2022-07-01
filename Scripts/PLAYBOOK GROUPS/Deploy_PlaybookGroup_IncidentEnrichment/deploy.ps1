Import-Module Az.Resources

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$myRg = 'RG-BC-Playbooks'

# Enrich-Sentinel-Incident-AlienVault-OTX

$deploymentName = "Enrich-Sentinel-Incident-AlienVault-OTX_" + $deploySuffix
Write-Host "Beginning deployment: $deploymentName"
$TemplateFile = "Enrich-Sentinel-Incident-AlienVault-OTX.json"
$ParameterFile = "Enrich-Sentinel-Incident-AlienVault-OTX.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Name $deploymentName `
    -Verbose


$deploymentName = "Get-GeoFromIpAndTagIncident" + $deploySuffix
Write-Host "Beginning deployment: $deploymentName"
$TemplateFile = "Get-GeoFromIpAndTagIncident.json"
$ParameterFile = "Get-GeoFromIpAndTagIncident.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Name $deploymentName `
    -Verbose


$deploymentName = "Comment-RemediationSteps_" + $deploySuffix
Write-Host "Beginning deployment: $deploymentName"
$TemplateFile = "Comment-RemediationSteps.json"
$ParameterFile = "Comment-RemediationSteps.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $ParameterFile `
    -Name $deploymentName `
    -Verbose


$PlaybookName = "Comment-RemediationSteps"
$RequiredPermissions = "Security Reader"
Write-Host "After successful deploymente of $PlaybookName,"
Write-Host "Assign $RequiredPermissions"

$PlaybookName = "Enrich-Sentinel-Incident-AlienVault-OTX"
$RequiredPermissions = "Microsoft Sentinel Responder, at RG level (minimum)"
Write-Host "After successful deploymente of $PlaybookName,"
Write-Host "Assign $RequiredPermissions"