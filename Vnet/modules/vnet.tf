# resource "azurerm_resource_group" "example" {
#   name     = var.resource_group_name
#   location = var.location
# }

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  location = var.location
}

resource "azurerm_subnet" "subnet1" {
#   count                = length(var.subnet_names)
  name                 = var.subnet1_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = var.subnet1_address_prefix
}

# resource "azurerm_subnet" "subnet2" {
# #   count                = length(var.subnet_names)
#   name                 = var.subnet2_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes    = var.subnet2_address_prefix
# }

# resource "azurerm_subnet" "subnet3" {
# #   count                = length(var.subnet_names)
#   name                 = var.subnet3_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes    = var.subnet3_address_prefix
# }

# resource "azurerm_subnet" "subnet4" {
# #   count                = length(var.subnet_names)
#   name                 = var.subnet4_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes    = var.subnet4_address_prefix
# }

# resource "azurerm_subnet" "subnet5" {
# #   count                = length(var.subnet_names)
#   name                 = var.subnet5_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes = var.subnet5_address_prefix
# }