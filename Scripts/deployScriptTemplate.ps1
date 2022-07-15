param(
    [Parameter(Mandatory = $true)]$ResourceGroup,
    [Parameter(Mandatory = $true)]$Location
)

Import-Module Az.Resources

# Connect to Azure account
Connect-AzAccount

$today = Get-Date -Format "MM-dd-yyyy"
$suffix = Get-Random -Maximum 100
$deploySuffix = $today + "_$suffix"

#  local deploys
$TemplateFile = ''
$ParameterFile = ''
$deploymentName = "" + $deploySuffix
New-AzResourceGroupDeployment -Name $deploymentName `
 -ResourceGroupName $ResourceGroup `
 -TemplateFile $TemplateFile `
 -TemplateParameterFile $ParameterFile `
 -Verbose


# remote deploys
$deploymentName = "basename_" + $deploySuffix
$remoteUrl = ""
$remoteTemplate = ''
New-AzResourceGroupDeployment -Name $deploymentName `
    -ResourceGroupName $ResourceGroup `
    -TemplateUri $remoteUrl `
    -TemplateParameterFile $remoteTemplate
    -Verbose


    
# USE FOR LOCAL TEMPLATE DEPLOYS
# New-AzResourceGroupDeployment -ResourceGroupName $myRg `
#  -TemplateFile $TemplateFile `
#  -TemplateParameterFile $ParameterFile `
#  -Name $deploymentName `
#  -Verbose
