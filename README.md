# 🌌 Azure CosmosDB Deployment via Terraform & Bash

Deploy an Azure CosmosDB NoSQL database and a container registry seamlessly with Terraform configurations and Bash scripts. This setup not only establishes the necessary infrastructure but also facilitates Docker image builds and pushes to the Azure Container Registry.

---

## 📋 Prerequisites

Before you get started, ensure you have the following:

- **Terraform**: Ensure it's installed.
- **Azure CLI**: Installed and authenticated with the necessary permissions.
- **Bash Environment**: To execute the provided scripts.

## 🚀 Usage

### 1️⃣ Clone the Repository

```bash
git clone [YOUR REPO URL HERE]
cd [YOUR REPO DIRECTORY]
```

2️⃣ Launch the Deployment Script
Kickstart your deployment with:

```bash
./run_all.sh
```

🔧 Actions
Deploy: Initializes the Azure CosmosDB NoSQL database and Azure Container Registry. Subsequently, it triggers the Docker image build and pushes the result to the registry.

Destroy: Effortlessly tears down all resources provisioned by the Terraform configurations.

🏗 Resources Deployed
Azure CosmosDB NoSQL Database: A robust and scalable database service tailored for global applications.
Azure Container Registry: A managed platform for private Docker container images.
Azure Container Group: Hosts a collection of containers scheduled on the same machine.

⚙ Customizing the Deployment
Tweak the deployment parameters in the variables.tf within the Terraform directory. Configurable items include:

container_registry_rg_name: Specify the resource group name for the container registry.
location: Define the Azure location for all resources.
acr_name: Assign a name to the Azure Container Registry.
acr_sku: Choose the desired SKU for the Azure Container Registry.

⚠ Important Notes

Interactive Scripts: The scripts will prompt users for inputs, like desired resource names.
Review Before Applying: Always inspect Terraform plans prior to applying them to ensure resources are set up correctly.
Use terraform destroy with Caution: This command will obliterate all the created resources.

🤝 Contributing
We welcome your pull requests! For substantial modifications, please initiate an issue first to discuss the proposed changes.