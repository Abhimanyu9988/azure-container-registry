variable "container_registry_rg_name" {
  description = "The name of the resource group for the container registry."
  default     = "container_registry_rg"
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  default     = "defaultACR"
  type        = string
}

variable "location" {
  description = "The location/region where the resources should be created in."
  default     = "East US"
  type        = string
}

variable "acr_sku" {
  description = "The SKU name of the Azure Container Registry."
  default     = "Basic"
  type        = string
}

variable "container_group_name"{
    default = "abhiContainerGroup"
    type = string
    description = "The name of the Container Group"
}

variable "repo_name" {
  description = "Name of the Docker repository"
  type        = string
  default     = "myimage"  # This is a default value. It will be overridden if another value is provided.
}