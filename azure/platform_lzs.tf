# resource "azurerm_subscription" "management" {
#   subscription_name = "management"
#   subscription_id = "XXXXXXXXXXXXX" # only because it was created on account setup
# }

# resource "azurerm_subscription" "connectivity" {
#   subscription_name = "connectivity"
#   billing_scope_id  = data.azurerm_billing_mca_account_scope.management.id
# }

# resource "azurerm_subscription" "identity" {
#   subscription_name = "identity"
#   billing_scope_id  = data.azurerm_billing_mca_account_scope.management.id
# }