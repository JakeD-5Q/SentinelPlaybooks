Import-Module Az.Resources

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

$TemplateFile = ''
$ParameterFile = ''

$myRg = ''

$remoteUrl = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-VTURLPositivesComment/azuredeploy.json"
$remoteParametersUrl = ''
New-AzResourceGroupDeployment -ResourceGroupName $myRg -TemplateUri $remoteUrl -TemplateParameterUri $remoteParametersUrl -Name $deploymentName -Verbose


$remoteUrl = ''
New-AzResourceGroupDeployment -ResourceGroupName $myRg -TemplateUri $remoteUrl  -Name $deploymentName -Verbose

$remoteUrl = ''
New-AzResourceGroupDeployment -ResourceGroupName $myRg -TemplateUri $remoteUrl  -Name $deploymentName -Verbose

$remoteUrl = ''
New-AzResourceGroupDeployment -ResourceGroupName $myRg -TemplateUri $remoteUrl  -Name $deploymentName -Verbose

$remoteUrl = ''
New-AzResourceGroupDeployment -ResourceGroupName $myRg -TemplateUri $remoteUrl  -Name $deploymentName -Verbose

$remoteUrl = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateUri $remoteUrl `
    -Verbose

# USE WHEN THERE MUST BE A PARAMETERS FILE
# $TemplateFile = ''
# $ParameterFile = ''
# $deploymentName = "" + $deploySuffix
# New-AzResourceGroupDeployment -Name $deploymentName `
#  -ResourceGroupName $myRg `
#  -TemplateFile $TemplateFile `
#  -TemplateParameterFile $ParameterFile `
#  -Verbose


# USE WHEN TEMPLATES ARE LOCAL
# $templateFile = ''
# $templateParameterFile = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $myRg `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $templateParameterFile `
    -Verbose