data "azurerm_application_gateway" "appGW" {
  name                = "appGW"
  resource_group_name = "COBALT_TMF"
  
}

output "id" {
  value = data.azurerm_application_gateway.appGW.id
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool {
    name       = var.node_pool_name
    node_count = 1
    vm_size    = var.vm_size1
    # vnet_subnet_id       = data.azurerm_subnet.subnet.id
  }

  # network_profile {
  #   network_plugin     = "azure"
  #   # service_cidr = "10.0.0.0/25"
  #   # dns_service_ip = "10.0.0.4"
  # }
  identity {
    type = "SystemAssigned"
  }
  ingress_application_gateway {
     gateway_id = data.azurerm_application_gateway.appGW.id
   }
}

resource "azurerm_kubernetes_cluster_node_pool" "agent" {
  name                  = var.agent_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.vm_size2
  node_count            = 1

  tags = {
    Environment = "Production"
  }
}



