# DeployPlaybooks

The intention of this repository is to create an easy and fast way to deploy the Sentinel playbooks that I use for each tenant. The ARM templates that you see in this repostiory are the playbooks that I have created myself and can be deployed individually (script or button) or all at once.



## Prerequisites
- Clone repository
- edit the parameter files

<p align="right">(<a href="#top">back to top</a>)</p>


## Usage

Clone the repository if you want to use all of the scripts or need to make edits to the templates, but if you would just like to deploy one thing it may be easier just to download the script desired.

The deployment scripts for the Github playbooks do not have any special requirements. All you must do is download or copy the script into a new *.ps1* file, then run it from powershell.

Example usage:

```powershell
$targetScript = "link to raw file on github"
Invoke-WebRequest -Uri $targetScript -OutFile targetScript.ps1
.\targetScript.ps1 -ResourceGroup $yourResourceGroupName -Location $yourLocation
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Post-deployment

All playbooks will have API connections that need to be updated. I plan to try to solve this problem in the future, but for now please perform the folowing tasks for *EACH PLAYBOOK* after a successful deploy:

- Go to the *Logic App Designer*
- Check each step for a API connection
- Update the connection with a new or existing API connection
- Save
- Go to the *API Connections* blade
- For each connection, go to *Edit connection*
- If applicable, click "Authorize connection", then enter your credentials
- Save

<p align="right">(<a href="#top">back to top</a>)</p>


### To do

- [x] Add 'Deploy to Azure' buttons
- [ ] Write README for all
- [ ] Organize other playbooks into deployment groups
- [ ] put the parameters file for each playbook into their respective group
- [ ] Write a script to deploy these playbooks
