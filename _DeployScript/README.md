# Deploy ARM templates

Use the following templatized scripts to deploy the desired type of template.


## Local Template

```powershell
$location = ''
$SubscriptionId = ''
$deploymentName = ''
$templateFile = ''
$templateParameterFile = ''


# Connect to Azure account
Connect-AzAccount

# Set the correct subscription
Set-AzContext $SubscriptionId

# deployment must be ran from the clients tenant

# local deployment
New-AzResourceGroupDeployment `
  -Name $DeploymentName `
  -Location $location `
  -TemplateFile $TemplateFile `
  -TemplateParameterFile $TemplateParameterFile `
  -Verbose
```

## Remote Templates


```powershell
$location = ''
$SubscriptionId = ''
$deploymentName = ''
$remoteUrl = ''

# Connect to Azure account
Connect-AzAccount

# Set the correct subscription
Set-AzContext $SubscriptionId

$remoteUrl = 'https://raw.githubusercontent.com/JakeD-5Q/SentinelPlaybooks/<PlaybookName>/template.json'

# remote deployment
New-AzResourceGroupDeployment `
  -Name $DeploymentName `
  -Location $location `
  -TemplateUri $remoteUrl `
  -Verbose
```