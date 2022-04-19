Import-Module Az.Resources
New-AzResourceGroupDeployment -ResourceGroupName YourRG -TemplateFile PlaybookName.json -TemplateParameterFile PlaybookName.parameters.json -Name PlaybookName -Verbose