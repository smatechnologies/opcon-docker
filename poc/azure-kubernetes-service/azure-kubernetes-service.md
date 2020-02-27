# Azure Kubernetes Service Creation #

From https://portal.azure.com:

- Create a "Resource Group". **Will contain all your resources**
  - Name: The name you want.
  - Registration: Development
  - Region: Central US
- Create Azure Kubernetes Service. **It's the service that will host the entire OpCon environment**.
  - Name: The name you want.
  - Choose the Resource Group from above.
  - Choose default setting for everything (it will do for starters).

# Kubernetes CLI Configuration #

- You have created the hosting environment above, but you still need to install the CLI in order to talk to the environment.
- You may use the Azure Cloud Shell (on portal.azure.com), where Kubernetes CLI is already installed. Or...
- This example is for Windows, but will be similar for Linux:
  - Download and install Azure CLI.
  - Run: az aks install-cli (installs Kubernetes CLI)
  - Run: az aks get-credentials --subscription Development --resource-group <ResourceGroup> --name <AKSName>\
(records credentials for Kubernetes Service)
- This is all you need to prepare your environment to run OpCon in a Kubernetes cluster.

# Run OpCon in the Cloud in a Kubernetes Cluster #

- Run: kubectl create -f opcon.yaml\
(This command takes the complete OpCon environment definition and submits it to Kubernetes Service)
- To check status of OpCon service:
  - Run: kubectl get svc opcon\
(This command shows the status of OpCon service - make sure the "EXTERNAL_IP" gets a valid IP address)
  - Run: kubectl get po\
(This command shows the status of the pods themselves - make sure "opcon-xxxx" pod shows "Running" status)
  - After 10 minutes or so, when "opcon-xxxx" is running and "opcon" service has valid external IP,\
go to https://<External IP>:8181

# Some Things to Remember #

- The Kubernetes YAML manifest that is available here has the complete definition to run\
OpCon in Azure Cloud inside Kubernetes Environment.
- The YAML file is POC and needs several updates to make it better (e.g. It has hard-coded\
environment variables), but will work as is.
- In theory, you should be able to run OpCon in any Kubernetes environment\
(Azure, Google Cloud, Local Kubernetes Service, etc.) However, if you use a local service\
(like the one that comes with Docker Desktop for Windows), this YAML file will not work.\
SQL Server fails to start for a reason that we don't yet know. OpCon itself starts, but\
without SQL Server it does not get very far.
- Your Kubernetes CLI configuration is stored in the "config" file under your user id\
(On Windows: C:\Users\<user>\.kube\config). If you wish to change anything, you may use\
"kubectl config -h" to get help on how to configure your Kubernetes CLI to get it to correctly\
talk to the Azure Kubernetes Service.