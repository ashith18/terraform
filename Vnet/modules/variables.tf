variable "resource_group_name" {
  description = "The name of the resource group in which to create the VNet"
  type = string
}

variable "location" {
  description = "The Azure region in which to create the VNet"
  type = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type = string
}

variable "address_space" {
  description = "The address space that is used the Virtual Network"
  type        = list
}

variable "subnet1_name" {
  description = "name of subnet1"
  type        = string
}

# variable "subnet2_name" {
#   description = "name of subnet2"
#   type        = string
# }

# variable "subnet3_name" {
#   description = "name of subnet3"
#   type        = string
# }

# variable "subnet4_name" {
#   description = "name of subnet4"
#   type        = string
# }

# variable "subnet5_name" {
#   description = "name of subnet5"
#   type        = string
# }

variable "subnet1_address_prefix" {
  description = "subnet1 address prefix"
  type        = list
}

# variable "subnet2_address_prefix" {
#   description = "subnet2 address prefix"
#   type        = list
# }

# variable "subnet3_address_prefix" {
#   description = "subnet3 address prefix"
#   type        = list
# }

# variable "subnet4_address_prefix" {
#   description = "subnet4 address prefix"
#   type        = list
# }

# variable "subnet5_address_prefix" {
#   description = "subnet5 address prefix"
#   type        = list
# }
