# ACR AKS Integration
module "aks_acr_integration" {
    source = "./modules/acr_aks"
    k8s_cluster_name = var.k8s_cluster_name
    resource_group_name = var.resource_group_name
    acr_name = var.acr_name
}
