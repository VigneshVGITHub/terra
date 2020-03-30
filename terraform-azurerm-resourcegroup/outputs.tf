# output "rgs" {
#     description = "The set of resource groups created by the module in each region"
#     value       = azurerm_resource_group.rg
# }

# output "rgs" 
#     value = {
#         "northeurope" = azurerm_resource_group.rg
#     }

output "rgs" {
    value    = "${element(concat(coalescelist(azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name), list("")), 0)}"
}
