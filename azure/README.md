# Example Azure Landing Zone

An example landing zone architecture using Terraform.

## Prerequisites

You must already have an Azure Cloud account; preferably a brand new account.

### Setup Notes

- Login to the Azure Portal as the root/admin account.
- Navigate to Microsoft EntraID and create an app registration
  - Note the name and credentials created; a standard name would be terraform-ci
- Go to Subscriptions and create a new subscription named "management"
  - Add the name of the app registration (terraform-ci) as Contributor and User Access Administrator

Example credentials:
```
CLIENT_ID: 76821e8f-6d7b-XXXX-a38b-c5e58eb69c2e
TENANT_ID: XXXX-d8ce-4c2b-aad2-3b3bdef87267
CLIENT_SECRET: XXXX
SECRET_ID: e177db5c-7d43-4ae9-XXXX-459320f8a3b9
```

Give the Application Service Principal Contributor and User Access roles

Export the values, for now, into the local environment
Configure terraform to work with AzureRM
Verify you can do a plan with outputs and stop
Setup build pipelines with the secrets configured above
Use the pipeline and stop doing local plan/apply

The terraform state can be manually created or done via terraform. It is preferable to to it via terraform.
- Create the resources and apply the changes
- Change the backend declaration to match the storage account created
- Apply the changes, migrating the state content on apply.

To allow terraform to create subscriptions, it needs billing contributor access 
-- Portal - Cost Management - IAM 
Stupid alias stuff makes you add these permissions

az role assignment create --role Owner --scope /providers/Microsoft.Subscription/aliases/management --assignee-principal-type ServicePrincipal --assignee-object-id cca0b29d-XXX-42fb-9ce5-6c2450430919

Create the desired management groups
Create the core subscriptions - identity, connectivity
Create policies and attach them; such as a resource creation block on the decommissioned management group

Managing user and groups in azuread_* requires App Registration API permission changes to match needs.
Need APPLICATION (they get delegated):
Application.ReadWrite.All
Directory.ReadWrite.All
Group.ReadWrite.All
GroupMember.ReadWrite.All
RoleManagement.ReadWrite.Directory
User.ReadWrite.All
Organization.ReadWrite.All
You need to go to the App Registration API Permissions after assignment and Grant consent

Should be able to work with management groups, create subscriptions, set policies, etc...