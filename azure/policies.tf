# resource "azurerm_policy_definition" "block_resources" {
#   name                = "no-more-resources"
#   policy_type         = "Custom"
#   mode                = "All"
#   display_name        = "Disabled Resource Creation"
#   description         = "Block the creation of new resources."
#   management_group_id = azurerm_management_group.decomissioned.id

#   policy_rule = <<POLICY_RULE
#    {
#       "if": {
#         "field": "type",
#         "like": "Microsoft.*"
#       },
#       "then": {
#         "effect": "deny"
#       }
#     }
# POLICY_RULE
# }

# resource "azurerm_policy_definition" "retain_all_logs" {
#   name                = "Retain Activity Logs"
#   policy_type         = "Custom"
#   mode                = "All"
#   display_name        = "Retain Activity Logs"
#   description         = "Retain Activity Logs for one year."
#   management_group_id = azurerm_management_group.root_group.id

#   policy_rule = <<POLICY_RULE
#    {
#       "if": {
#         "field": "type",
#         "equals": "Microsoft.Resources/subscriptions"
#       },
#       "then": {
#         "effect": "AuditIfNotExists",
#         "details": {
#           "type": "Microsoft.Insights/logProfiles",
#           "existenceCondition": {
#             "anyOf": [
#               {
#                 "allOf": [
#                   {
#                     "field": "Microsoft.Insights/logProfiles/retentionPolicy.enabled",
#                     "equals": "true"
#                   },
#                   {
#                     "field": "Microsoft.Insights/logProfiles/retentionPolicy.days",
#                     "equals": "365"
#                   }
#                 ]
#               },
#               {
#                 "allOf": [
#                   {
#                     "field": "Microsoft.Insights/logProfiles/retentionPolicy.enabled",
#                     "equals": "false"
#                   },
#                   {
#                     "field": "Microsoft.Insights/logProfiles/retentionPolicy.days",
#                     "equals": "0"
#                   }
#                 ]
#               }
#             ]
#           }
#         }
#       }
#     }
# POLICY_RULE
# }

# resource "azurerm_policy_definition" "forward_subscription_logs" {
#   name                = "forward-sub-logs"
#   policy_type         = "Custom"
#   mode                = "All"
#   display_name        = "Forward Subscription Logs"
#   description         = "Forward subscription logs to the management log analytics workspace."
#   management_group_id = azurerm_management_group.root_group.id

#   policy_rule = <<POLICY_RULE
#    {
#       "if": {
#         "field": "type",
#         "equals": "Microsoft.Resources/subscriptions"
#       },
#       "then": {
#         "effect": "DeployIfNotExists",
#         "details": {
#           "type": "Microsoft.Insights/diagnosticSettings",
#           "deploymentScope": "Subscription",
#           "existenceScope": "Subscription",
#           "existenceCondition": {
#             "allOf": [
#               {
#                 "field": "Microsoft.Insights/diagnosticSettings/logs.enabled",
#                 "equals": "True"
#               },
#               {
#                 "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
#                 "equals": "True"
#               }
#             ]
#           },
#           "deployment": {
#             "location": "northeurope",
#             "properties": {
#               "mode": "incremental",
#               "template": {
#                 "$schema": "https://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json#",
#                 "contentVersion": "1.0.0.0",
#                 "variables": {},
#                 "resources": [
#                   {
#                     "name": "subscriptionToLa",
#                     "type": "Microsoft.Insights/diagnosticSettings",
#                     "apiVersion": "2017-05-01-preview",
#                     "location": "Global",
#                     "properties": {
#                       "workspaceId": "${azurerm_log_analytics_workspace.central.id}",
#                       "logs": [
#                         {
#                           "category": "Administrative",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "Security",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "ServiceHealth",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "Alert",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "Recommendation",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "Policy",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "Autoscale",
#                           "enabled": "True"
#                         },
#                         {
#                           "category": "ResourceHealth",
#                           "enabled": "True"
#                         }
#                       ]
#                     }
#                   }
#                 ],
#                 "outputs": {}
#               }
#             }
#           },
#           "roleDefinitionIds": [
#             "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
#           ]
#         }
#       }
#     }
# POLICY_RULE
# }