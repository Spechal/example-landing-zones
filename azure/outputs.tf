output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

# output "billing_scope_id" {
#   value = data.azurerm_billing_mca_account_scope.management.id
# }