# Start-MDEAutomatedInvestigation

This playbook will call the start automated investigation in MDE.  It will then add a comment to the incident and post a message in Teams.


[link to raw](#https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Start-MDEAutomatedInvestigation/alert-trigger/azuredeploy.json)


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FStart-MDEAutomatedInvestigation%2Falert-trigger%2Fazuredeploy.json)

## Prerequisites

- [This](https://www.linkedin.com/pulse/3-ways-locate-microsoft-team-id-christopher-barber-/) blog shows some simple methods to get the Team Id.  You will need the Team Id and Channel Id.

- You will need to grant Alert.ReadWrite.All permissions to the managed identity.  Run the following code replacing the managed identity object id.  You find the managed identity object id on the Identity blade under Settings for the Logic App.


## 5Q SOC Teams information

**Refer to the *Customer Bible*, in the Operational Tasks section, for these values**


```powershell
$MIGuid = "<Enter your managed identity guid here>"
$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

$MDEAppId = "fc780465-2017-40d4-a0c5-307022471b92"
$PermissionName = "Alert.ReadWrite.All"

$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$MDEAppId'"
$AppRole = $MDEServicePrincipal.AppRoles | Where-Object {$_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application"}
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
-ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id
```
