module "vnet" {
  source              = "./modules/"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet1_name        = var.subnet1_name
  # subnet2_name = var.subnet2_name
  # subnet3_name = var.subnet3_name
  # subnet4_name = var.subnet4_name
  # subnet5_name = var.subnet5_name
  subnet1_address_prefix = var.subnet1_address_prefix
  # subnet2_address_prefix = var.subnet2_address_prefix
  # subnet3_address_prefix = var.subnet3_address_prefix
  # subnet4_address_prefix = var.subnet4_address_prefix
  # subnet5_address_prefix = var.subnet5_address_prefix
}