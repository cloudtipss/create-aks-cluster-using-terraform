## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.75.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | Azure/aks/azurerm | 7.4.0 |
| <a name="module_network"></a> [network](#module\_network) | Azure/network/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.aks-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | AKS name in Azure | `string` | `"test-aks"` | no |
| <a name="input_location"></a> [location](#input\_location) | Resources location in Azure | `string` | `"eastus"` | no |
| <a name="input_orchestrator_version"></a> [orchestrator\_version](#input\_orchestrator\_version) | Kubernetes version | `string` | `"1.26.6"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | `"test"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size of the agent VMs | `string` | `"Standard_DS3_v2"` | no |

## Outputs

No outputs.
