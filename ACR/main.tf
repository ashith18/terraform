module "acr" {
  source              = "./modules/"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku  
  admin_enabled       = var.admin_enabled
  vnet_name = var.vnet_name
  subnet_name = var.subnet_name
}