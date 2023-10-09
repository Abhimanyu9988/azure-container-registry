#!/bin/bash

# Color variables
GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[1;34m"
BOLD="\033[1m"
RESET="\033[0m"

# Ask if user wants to create container registry
echo -en "${GREEN}Do you wish to create a container registry on Azure? (yes/no) ${RESET}"
read -t 20 create_registry

if [[ -z "$create_registry" ]]; then
    echo -e "\n${BOLD}${RED}Defaulting to No, Goodbye!!${RESET}"
    exit 1
elif [[ "$create_registry" =~ ^[yY].* ]]; then
    echo -en "${GREEN}Enter the name for the container registry: ${RESET}"
    read acr_name
    echo -en "${GREEN}What name do you want for your repository? ${RESET}"
    read repo_name

    # Navigate to the Terraform directory
    cd Terraform

    # Deploy ACR
    terraform init
    terraform apply -auto-approve -target=azurerm_container_registry.acr -var="acr_name=$acr_name" -var="repo_name=$repo_name"
    
    # After ACR deployment, deploy the Dockerfile
    acr_login_server_raw=$(terraform output -raw acr_login_server)
    cd ..
    az acr build --image $repo_name \
        --registry $acr_login_server_raw \
        --platform linux/amd64 --file Dockerfile .

    # Deploy container group after Dockerfile deployment
    cd Terraform
    terraform apply -auto-approve -target=azurerm_container_group.container_group -var="acr_name=$acr_name" -var="repo_name=$repo_name"

    echo -e "${BOLD}${GREEN}Congratulations, Container registry and Container group deployed.${RESET}"
else
    echo -e "${RED}Goodbye!${RESET}"
    exit 1
fi
