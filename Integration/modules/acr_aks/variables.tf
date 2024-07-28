# AKS ACR INTEGRATION
variable "k8s_cluster_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "acr_name" {
  description = "The name of the AKS cluster."
  type        = string
}
