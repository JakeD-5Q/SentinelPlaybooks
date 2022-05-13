Import-Module Az.Resources

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$myRg = 'RG-BC-Playbooks'


# Get-VirusTotalDomainReport
# `````````````````````````````````````````````````````````````````````````````````````
# The following playbooks must be attached to an automation rule for them to be used
Write-Host "The following playbooks must be attached to an automation rule for them to be used"
# `````````````````````````````````````````````````````````````````````````````````````
$deploymentName = "Get-VTDomain_" + $deploySuffix
$TemplateFile = "Get-VirusTotalDomainReport.json"
$ParameterFile = "Get-VirusTotalDomainReport.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Name $deploymentName `
 -Verbose

# Get-VirusTotalFileInfo
$deploymentName = "Get-VTFile_" + $deploySuffix
$TemplateFile = "Get-VirusTotalFileInfo.json"
$ParameterFile = "Get-VirusTotalFileInfo.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Name $deploymentName `
 -Verbose

# Get-VirusTotalIPReport
$deploymentName = "Get-VTIPaddr_" + $deploySuffix
$TemplateFile = "Get-VirusTotalIPReport.json"
$ParameterFile = "Get-VirusTotalIPReport.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Name $deploymentName `
 -Verbose

# Get-VirusTotalURLReport
$deploymentName = "Get-VTURL_" + $deploySuffix
$TemplateFile = "Get-VirusTotalURLReport.json"
$ParameterFile = "Get-VirusTotalURLReport.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Name $deploymentName `
 -Verbose


# Get-VTURLPositivesComment
# `````````````````````````````````````````````````````````````````````````````````````
Write-Host "This playbooks uses an alert trigger, therefore must be triggered manually but it can also be added as an automated response per analytic rule"
# `````````````````````````````````````````````````````````````````````````````````````
$deploymentName = "Get-VTURLPositivesComment_" + $deploySuffix
$TemplateFile = "Get-VTURLPositivesComment.json"
$ParameterFile = "Get-VTURLPositivesComment.parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName $myRg `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Name $deploymentName `
 -Verbose