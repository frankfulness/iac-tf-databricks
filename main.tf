terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "databricks" {
  host  = var.host
  token = var.token
}

# Add a simple data source to test authentication
data "databricks_current_user" "me" {}

# Output to verify we can get data
output "current_user" {
  value = data.databricks_current_user.me.user_name
}
