resource "azurerm_resource_group" "aks-rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.aks-rg.name
  address_spaces      = ["10.20.0.0/16"]
  subnet_prefixes     = ["10.20.0.0/21"]
  subnet_names        = ["subnet1"]
  depends_on = [azurerm_resource_group.aks-rg]
  use_for_each = true
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "7.4.0"
  
  prefix              = "dev"
  cluster_name        = var.cluster_name
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = var.location
  agents_pool_name    = "testpool"
  agents_availability_zones = [1, 2]
  agents_size         = var.vm_size
  orchestrator_version = var.orchestrator_version
  enable_auto_scaling = true
  agents_min_count = 1
  agents_max_count = 6
  agents_max_pods  = 100
  vnet_subnet_id   = module.network.vnet_subnets[0]
  network_plugin   = "azure"
  network_policy   = "calico"
  rbac_aad         = false
  private_cluster_enabled = false
  node_pools = {
    pool1 = {
      name                  = "pool1"
      vm_size               = var.vm_size
      enable_auto_scaling   = true
      node_count            = 1
      min_count             = 1
      max_count             = 5
      vnet_subnet_id        = module.network.vnet_subnets[0]
      orchestrator_version = var.orchestrator_version
      mode = "User"
    }
  }

  depends_on = [azurerm_resource_group.aks-rg, module.network]
}
