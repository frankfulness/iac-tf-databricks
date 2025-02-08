# Databricks Terraform Provider

## Documentation:

https://docs.databricks.com/en/dev-tools/terraform/index.html#sample-configuration

### Databricks Terraform Authentication:

https://registry.terraform.io/providers/databrickslabs/databricks/latest/docs#authentication

https://docs.databricks.com/en/dev-tools/auth/index.html

Due to cost, databricks trial accounts don't allow service principals to be created from the Workspace, so we'll be using a PAT for this. Databricks recommends using OAuth over PATS because of automatic refresh for security... oh well.
Settings -> User -> Developer -> Access Tokens -> Manage -> Generate new token (tf-poc, 730 days)

However, regarding the Service principal method:

> For service principal authorization, Databricks OAuth requires that the caller provide client credentials along with a token endpoint URL where the request can be authorized. (This is handled for you if you use Databricks tools and SDKs that support Databricks unified client authentication.) The credentials include a unique client ID and client secret. The client, which is the Databricks service principal that will run your code, must be assigned to Databricks workspaces. After you assign the service principal to the workspaces it will access, you are provided with a client ID and a client secret that you will set with specific environment variables.


Because we're using PAT for this trial:

https://docs.databricks.com/en/dev-tools/auth/pat.html

