# resource "azurerm_management_group_policy_assignment" "decomissioned_lock" {
#   name                 = "decomissioned-lock"
#   policy_definition_id = azurerm_policy_definition.block_resources.id
#   management_group_id  = azurerm_management_group.decomissioned.id
# }

# resource "azurerm_management_group_policy_assignment" "subscription_log_forwarding" {
#   name                 = "subscription-logs"
#   policy_definition_id = azurerm_policy_definition.forward_subscription_logs.id
#   management_group_id  = azurerm_management_group.root_group.id
# }
