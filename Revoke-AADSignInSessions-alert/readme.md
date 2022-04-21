# Revoke-AADSignInSessions


This playbook will revoke all signin sessions for the user using Graph API. It will send and email to the user's manager.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FRevoke-AADSignInSessions%2Falert-trigger%2Fazuredeploy.json" target="_blank">
<img src="https://aka.ms/deploytoazurebutton""/>
</a>


[link to raw](https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Revoke-AADSignInSessions/alert-trigger/azuredeploy.json)


## Prerequisites

- You will need to grant User.ReadWrite.All permissions to the managed identity.  Run the following code replacing the managed identity object id.  You find the managed identity object id on the Identity blade under Settings for the Logic App.


```powershell
$MIGuid = "<Enter your managed identity guid here>"
$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

$GraphAppId = "00000003-0000-0000-c000-000000000000"
$PermissionName = "User.ReadWrite.All"

$GraphServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$GraphAppId'"
$AppRole = $GraphServicePrincipal.AppRoles | Where-Object {$_.Value -eq $PermissionName -and $_.AllowedMemberTypes -contains "Application"}
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId `
-ResourceId $GraphServicePrincipal.ObjectId -Id $AppRole.Id
```
