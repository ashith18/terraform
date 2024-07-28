variable "RESOURCE_GROUP_NAME" {
  type        = string
  description = "Resource group"
  default     = "COBALT_TMF"
}

variable "APP_GATEWAY_NAME" {
  type        = string
  description = "Application name. Use only lowercase letters and numbers"
  default     = "appgw"

}

variable "LOCATION" {
  type        = string
  description = "Azure region where to create resources."
  default     = "West Europe"
}

variable "VIRTUAL_NETWORK_NAME" {
  type        = string
  description = "Virtual network name. This service will create subnets in this network."
  default     = "VNET-DEV-01"
}

variable "APPGW_PUBLIC_IP_NAME" {
  type        = string
  description = "PUBLIC IP. This service will create subnets in this network."
  default     = "appgw-public-ip"
}
