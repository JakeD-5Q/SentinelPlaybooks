Import-Module Az.Resources
New-AzResourceGroupDeployment -ResourceGroupName "5Q-RG-Playbooks" `
 -TemplateFile "template.json" `
 -TemplateParameterFile "5q.parameters.json" `
 -Name "Watchlist-Add-IPToMaliciousIPList" `
 -Verbose