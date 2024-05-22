# resource "azurerm_management_group" "root_group" {
#   display_name = "TravisDoesIT"
# }

# resource "azurerm_management_group" "platform" {
#   parent_management_group_id = azurerm_management_group.root_group.id
#   display_name = "Platform"
# }

# resource "azurerm_management_group" "identity" {
#   parent_management_group_id = azurerm_management_group.platform.id
#   display_name = "Identity"
#   subscription_ids = [
#     azurerm_subscription.identity.subscription_id, 
#   ]
# }

# resource "azurerm_management_group" "management" {
#   parent_management_group_id = azurerm_management_group.platform.id
#   display_name = "Management"
#   subscription_ids = [
#     data.azurerm_subscription.current.subscription_id, 
#   ]
# }

# resource "azurerm_management_group" "connectivity" {
#   parent_management_group_id = azurerm_management_group.platform.id
#   display_name = "Connectivity"
#   subscription_ids = [
#     azurerm_subscription.connectivity.subscription_id, 
#   ]
# }

# resource "azurerm_management_group" "landing_zones" {
#   parent_management_group_id = azurerm_management_group.root_group.id
#   display_name = "Landing Zones"
# }

# resource "azurerm_management_group" "decomissioned" {
#   parent_management_group_id = azurerm_management_group.root_group.id
#   display_name = "Decomissioned"
# }

# resource "azurerm_management_group" "sandboxes" {
#   parent_management_group_id = azurerm_management_group.root_group.id
#   display_name = "Sandboxes"
#   subscription_ids = [
#     azurerm_subscription.sandbox.subscription_id, 
#   ]
# }
