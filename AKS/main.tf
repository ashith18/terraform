module "aks_cluster" {
  source                  = "./modules/"
  resource_group_name     = var.resource_group_name
  aks_cluster_name        = var.aks_cluster_name
  location                = var.location
  dns_prefix              = var.dns_prefix
  node_pool_name          = var.node_pool_name
  agent_name              = var.agent_name
  node_count              = var.node_count
  vm_size1                = var.vm_size1
  vm_size2                = var.vm_size2
  private_cluster_enabled = var.private_cluster_enabled
  # vnet_name = var.vnet_name
  # subnet_name = var.subnet_name
  # vnet_subnet_id = var.vnet_subnet_id
}

