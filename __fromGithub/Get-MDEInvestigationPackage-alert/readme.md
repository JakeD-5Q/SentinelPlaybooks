# Get-MDEInvestigationPackage


This playbook will call the collect investigation package in MDE.  It will then loop until that's complete, once complete it will add a comment to the incident and post a message in teams with the URL to download the package.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FGet-MDEInvestigationPackage%2Falert-trigger%2Fazuredeploy.json)

[link to raw](https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Get-MDEInvestigationPackage/alert-trigger/azuredeploy.json)

## Prerequisites

- [This](https://www.linkedin.com/pulse/3-ways-locate-microsoft-team-id-christopher-barber-/) blog shows some simple methods to get the Team Id.  You will need the Team Id and Channel Id.

- You will need to grant Machine.CollectForensics permissions to the managed identity.  Run the following code replacing the managed identity object id.  You find the managed identity object id on the Identity blade under Settings for the Logic App.

```powershell
$MIGuid = "<Enter your managed identity guid here>"
$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

$MDEAppId = "fc780465-2017-40d4-a0c5-307022471b92"
$PermissionName = "Machine.CollectForensics"

$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$MDEAppId'"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object {$_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application"}
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
-ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id
```
