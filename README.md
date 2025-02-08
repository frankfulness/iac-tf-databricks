# 🥡 Databricks Terraform Provider

## 🗃️ Documentation

<https://github.com/databricks/terraform-provider-databricks>

<https://docs.databricks.com/en/dev-tools/terraform/index.html#sample-configuration>

### 🔐 Databricks Terraform Authentication

<https://registry.terraform.io/providers/databrickslabs/databricks/latest/docs#authentication>

<https://docs.databricks.com/en/dev-tools/auth/index.html>

Due to cost, databricks trial accounts don't allow service principals to be created from the Workspace, so we'll be using a PAT for this. Databricks recommends using OAuth over PATS because of automatic refresh for security... oh well.
Settings -> User -> Developer -> Access Tokens -> Manage -> Generate new token (tf-poc, 730 days)

However, regarding the Service principal method:

> For service principal authorization, Databricks OAuth requires that the caller provide client credentials along with a token endpoint URL where the request can be authorized. (This is handled for you if you use Databricks tools and SDKs that support Databricks unified client authentication.) The credentials include a unique client ID and client secret. The client, which is the Databricks service principal that will run your code, must be assigned to Databricks workspaces. After you assign the service principal to the workspaces it will access, you are provided with a client ID and a client secret that you will set with specific environment variables.

Because we're using PAT for this trial:

<https://docs.databricks.com/en/dev-tools/auth/pat.html>

## 💡 Overall 1 Hr Investment Thoughts
- The `.tfvars` is git ignored, check my example. To verify PAT authentication, in `main.tf` I included a sample output of my databricks current user. When you tfi & tfa `terraform init` and `terraform plan`, you will see your databricks trial account email.
- This has 4 simple components: The `auth`, the `notebook`, the `cluster`, & the `job`. However, because of trial limitations, I had to remove cluster, utilize the out of the box serverless compute, not create a cluster, nor could I create a python nnotebook because serverless compute only works for sql.
- Thus, I ended up going with a simple sql file ran by the `notebook.tf` setup which automatically ran the job for me shown below. Then afterward, I could destroy everything (the workspace & notebook) without deleting the job ran history. Given less trial limitations and more than an hour on a Saturday, I could have done significantly more.


terraform apply results in creation of workspace, notebook, job using db serverless compute, & automated run of job:

https://github.com/user-attachments/assets/4201f0bf-4200-4ca6-af5f-309abdff2820

terraform destroy results in removal of workspace & notebood, but without removing job run workflow history:

https://github.com/user-attachments/assets/c72e4b39-bea6-4ec2-bb1f-f33c79174445


