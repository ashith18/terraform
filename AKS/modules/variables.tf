
variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "A unique DNS prefix to use with the AKS cluster."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the default node pool."
  type        = string
}

variable "agent_name" {
  description = "The name of the agent node pool."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
}

variable "vm_size1" {
  description = "The size of the VMs in the default node pool."
  type        = string
}

variable "vm_size2" {
  description = "The size of the VMs in the agent node pool."
  type        = string
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
}

# variable "vnet_name" {
#    description = "name of vnet"
#   type = string
# }

# variable "subnet_name" {
#    description = "name of vnet"
#   type = string
# }

# variable "vnet_subnet_id" {
#   description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
#   type        = string
# }