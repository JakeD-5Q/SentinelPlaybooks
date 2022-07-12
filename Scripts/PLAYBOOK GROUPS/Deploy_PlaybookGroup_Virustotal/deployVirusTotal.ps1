Import-Module Az.Resources

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$myRg = 'RG-BC-Playbooks'

# USE FOR LOCAL TEMPLATE DEPLOYS
# New-AzResourceGroupDeployment -ResourceGroupName $myRg `
#  -TemplateFile $TemplateFile `
#  -TemplateParameterFile $ParameterFile `
#  -Name $deploymentName `
#  -Verbose


# `````````````````````````````````````````````````````````````````````````````````````
# Write-Host "This playbooks uses an alert trigger, therefore must be triggered manually but it can also be added as an automated response per analytic rule"
# `````````````````````````````````````````````````````````````````````````````````````
# $deploymentName = "Get-VTURLPositivesComment_" + $deploySuffix
# $remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VTURLPositivesComment/azuredeploy.json"
# remoteParameterUrl = ""
# New-AzResourceGroupDeployment -Name $deploymentName `
#     -ResourceGroupName $myRg `
#     -TemplateUri $remoteUrl `
#     -Verbose

# `````````````````````````````````````````````````````````````````````````````````````
# The following playbooks must be attached to an automation rule for them to be used
Write-Host "The following playbooks must be attached to an automation rule for them to be used"
# `````````````````````````````````````````````````````````````````````````````````````
$deploymentName = "Get-VTDomain_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalDomainReport/incident-trigger/azuredeploy.json"
New-AzResourceGroupDeployment -Name $deploymentName `
 -ResourceGroupName $myRg `
 -TemplateUri $remoteUrl `
 -Verbose

$deploymentName = "Get-VTFile_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalFileInfo/incident-trigger/azuredeploy.json"
New-AzResourceGroupDeployment -Name $deploymentName `
 -ResourceGroupName $myRg `
 -TemplateUri $remoteUrl `
 -Verbose


$deploymentName = "Get-VTIPaddr_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalIPReport/incident-trigger/azuredeploy.json"
New-AzResourceGroupDeployment -Name $deploymentName `
 -ResourceGroupName $myRg `
 -TemplateUri $remoteUrl `
 -Verbose

$deploymentName = "Get-VTURL_" + $deploySuffix
$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VirusTotalURLReport/incident-trigger/azuredeploy.json"
New-AzResourceGroupDeployment -Name $deploymentName `
 -ResourceGroupName $myRg `
 -TemplateUri $remoteUrl `
 -Verbose