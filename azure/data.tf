# data "aws_caller_identity" "current" {}

# data "aws_organizations_organization" "current" {}

data "azurerm_subscription" "current" {}
data "azuread_client_config" "current" {}

# data "azurerm_billing_mca_account_scope" "management" {
#   billing_account_name = ""
#   billing_profile_name = ""
#   invoice_section_name = ""
# }

# data "azurerm_subscription" "identity" {
#   provider = azurerm.identity
# }

# data "azurerm_subscription" "connectivity" {
#   provider = azurerm.connectivity
# }