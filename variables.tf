variable "host" {
  description = "Databricks workspace URL"
  type        = string
}

variable "token" {
  description = "Databricks TRIAL Personal Access Token"
  type        = string
  sensitive   = true
}
