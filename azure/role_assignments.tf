# resource "azurerm_role_assignment" "identity_admins" {
#   scope                = "/subscriptions/${azurerm_subscription.identity.subscription_id}"
#   role_definition_name = "Owner"
#   principal_id         = azuread_group.cse.object_id
# }

# resource "azurerm_role_assignment" "connectivity_admins" {
#   scope                = "/subscriptions/${azurerm_subscription.connectivity.subscription_id}"
#   role_definition_name = "Owner"
#   principal_id         = azuread_group.cse.object_id
# }