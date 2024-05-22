provider "azurerm" {
  features { }
  skip_provider_registration = true
}

# provider "azurerm" {
#   features { }
#   skip_provider_registration = true
#   alias = "identity"
#   subscription_id = azurerm_subscription.identity.subscription_id
# }

# provider "azurerm" {
#   features { }
#   skip_provider_registration = true
#   alias = "connectivity"
#   subscription_id = azurerm_subscription.connectivity.subscription_id
# }

# provider "azuread" { }