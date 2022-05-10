# Watchlists-CloseIncidentKnownIP

This playbook levarages Azure Sentinel Watchlists in order to close incidents which include IP addresses considered safe.

For each Ip address included in the alert (entities of type IP):

1. Check if IP is included in watchlist.
    * If IP is in the watchlist, consider the IP saf,. **Add it to Safe IPs array.**
    * If IP is not in the watchlist, meaning that we are not sure it is safe, **Add it to not Safe IPs array.**
2. Add a comment to the incident the list of safe and not safe IPs found.
3. If the not safe list is empty (length == 0), close the incident as Benign Positive.
<br>

## Configurations

* Configure the step "Run query and list results" with the identifiers of the Sentinel workspace where the watchlist is stored.
* Configure the identity used in the "Run query and list results" step with the Log Analytics Reader RBAC role on the Azure Sentinel resource group.
* Configure the Managed Idenitty of the Logic App with the Azure Sentinel Responder RBAC role on the Azure Sentinel resource group.
* The watchlist used in this example has at list one column named **ipaddress** which stores the safe address. See the csv file attached in this folder as an example.
<br><br>



[link to original template](<https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Playbooks/Watchlist-CloseIncidentKnownIPs/azuredeploy.json>)



[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FPlaybooks%2FWatchlist-CloseIncidentKnownIPs%2Fazuredeploy.json)
