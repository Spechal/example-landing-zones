terraform {
    required_version = "~> 1.8.0"

    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.104.2"
        }
    }
}

# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "3.63.0"
#     }
#     azuread = {
#       source = "hashicorp/azuread"
#       version = "2.39.0"
#     }
#   }
#   backend "azurerm" {
#     resource_group_name  = "terraform-state"
#     storage_account_name = "travisdoesit"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#   }
# }