# resource "azurerm_user_assigned_identity" "terraform" {
#   location            = "Central US"
#   name                = "terraform"
#   resource_group_name = azurerm_resource_group.terraform.name
# }