variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
  default     = "test"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
  default     = "eastus"
}
variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
  default     = "test-aks"
}

variable "orchestrator_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.26.6"
}

variable "vm_size" {
  type        = string
  description = "Size of the agent VMs"
  default     = "Standard_DS3_v2"
}