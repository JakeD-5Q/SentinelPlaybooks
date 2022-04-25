# Deploy ARM templates

To deploy these ARM templates using Azure PowerShell use the following script template for deploying local templates:

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
New-AzDeployment `
  -Name $DeploymentName `
  -Location $location `
  -TemplateFile $TemplateFile `
  -TemplateParameterFile $TemplateParameterFile `
  -Verbose
```


To deploy remote templates:



```powershell
$location = ''
$SubscriptionId = ''
$deploymentName = ''
$remoteUrl

# Connect to Azure account
Connect-AzAccount

# Set the correct subscription
Set-AzContext $SubscriptionId

$remoteUrl = 'https://raw.githubusercontent.com/JakeD-5Q/SentinelPlaybooks/<PlaybookName>/template.json'

remote deployment
New-AzDeployment `
  -Name $DeploymentName `
  -Location $location `
  -TemplateUri $remoteUrl `
  -Verbose

```