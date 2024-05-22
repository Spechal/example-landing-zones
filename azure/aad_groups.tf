# resource "azuread_group" "cse" {
#   display_name     = "Cloud Services Engineering"
#   description      = "User group for Admins in Cloud Services Engineering" 
#   security_enabled = true
#   owners           = [
#     data.azuread_client_config.current.object_id
#   ]
#   members = [
#     "5f1256e6-0304-43ff-b3aa-044beb08e873", // travisdoesit -> Travis Crowder user account
#     /* more users */
#   ]
# }