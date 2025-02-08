variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
  default     = "Terraform Test"
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
}

variable "notebook_language" {
  description = "The language of the notebook."
  type        = string
}

# Add directory resource
resource "databricks_directory" "this" {
  path = "${data.databricks_current_user.me.home}/${var.notebook_subdirectory}"
}

resource "databricks_notebook" "this" {
  path     = "${databricks_directory.this.path}/${var.notebook_filename}"
  language = var.notebook_language
  source   = "./${var.notebook_filename}"
  
  # Add explicit dependency
  depends_on = [databricks_directory.this]
}

output "notebook_url" {
  value = databricks_notebook.this.url
}
