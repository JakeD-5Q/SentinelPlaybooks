# Block-AADUser-alert


1.[ Assign Microsoft Sentinel Responder](https://docs.microsoft.com/azure/logic-apps/create-managed-service-identity?tabs=consumption#assign-managed-identity-role-based-access-in-the-azure-portal) role to the Playbook's managed identity.

2. Assign API permissions to the managed identity so that we can search for user's manager. You can find the managed identity object ID on the Identity blade under Settings for the Logic App. If you don't have Azure AD PowerShell module, you will have to install it and connect to [Azure AD PowerShell module](https://docs.microsoft.com/powershell/azure/active-directory/install-adv2?view=azureadps-2.0)

3. Open the playbook in the Logic App Designer and authorize Azure AD and Office 365 Outlook Logic App connections


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FBlock-AADUser%2Fincident-trigger%2Fazuredeploy.json)


[link to raw](https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Block-AADUser/alert-trigger/azuredeploy.json)
