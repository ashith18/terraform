data "azurerm_kubernetes_cluster" "kube" {
  name                = var.k8s_cluster_name
  resource_group_name = var.resource_group_name
}

data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
}

output "login_server" {
  value = data.azurerm_container_registry.acr.login_server
}

resource "azurerm_role_assignment" "acr_aks_role" {
  principal_id                     = data.azurerm_kubernetes_cluster.kube.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
