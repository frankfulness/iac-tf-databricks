variable "job_name" {
  description = "A name for the job."
  type        = string
  default     = "My TF Job"
}

variable "task_key" {
  description = "A name for the task."
  type        = string
  default     = "my_tf_task"
}

variable "warehouse_id" {
  description = "The ID of the SQL warehouse"
  type        = string
  default     = "8c5ef597b38c458a"
}

resource "databricks_job" "this" {
  name = var.job_name

  task {
    task_key = var.task_key
    
    notebook_task {
      notebook_path = databricks_notebook.this.path
      warehouse_id = var.warehouse_id
    }
  }

  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

  # Provisioner to run the job after creation
  provisioner "local-exec" {
    command = <<EOF
      curl -X POST -H "Authorization: Bearer ${var.token}" \
      ${var.host}/api/2.0/jobs/run-now \
      -d '{"job_id": "${self.id}"}'
    EOF
  }
}
