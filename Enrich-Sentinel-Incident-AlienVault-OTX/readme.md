# Enrich-Sentinel-Incident-AlienVault-OTX

This playbook will enrich a Sentinel Incident with pulse information from AlienVault OTX.  If any pulses are found the Incident will also be tagged and the severity raised to High.

The following entity types will be enriched with this playbook:

- IP
- URL
- File hash
- DNS

## Prerequisites

- After deploying the the playbook you will need to grant the playbook's Managed Identity **Azure Sentinel Responder** (or greater) access to the resource group where Azure Sentinel is installed. This gives the Managed Identity the necessary permissions to add comments, tags, and change incident severity.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FEnrich-Sentinel-Incident-AlienVault-OTX%2Fazuredeploy.json)


[LINK TO RAW](#https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Enrich-Sentinel-Incident-AlienVault-OTX/azuredeploy.json)
