# Connect to Azure account
Connect-AzAccount

# Set the correct subscription
Set-AzContext $SubscriptionId

# deployment must be ran from the clients tenant

# local deployment
New-AzDeployment `
    -Name $DeploymentName `
    -Location $location `
    -TemplateFile $TemplateFile `
    -TemplateParameterFile $TemplateParameterFile `
    -Verbose


# $remoteUrl = 'https://raw.githubusercontent.com/JakeD-5Q/DeploySentinelProcedure/main/01-Lighthouse/lighthouse.template.json'

# remote deployment
# New-AzDeployment `
#   -Name $DeploymentName `
#   -Location $location `
#   -TemplateUri $remoteUrl `
#   -Verbose
