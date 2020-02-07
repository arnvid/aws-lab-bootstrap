# IMPORTANT
The process described below is only initiated once per AWS account during bootstrap!
All terraform IaC depends on these resources:
- The AWS S3 bucket is used by Terraform to store tfstate files
- The AWS DynamoDB table is used by Terraform for state locking

## 1: Create bucket and lock table used by backend
```
mv state.tf state.tf.notyet
terraform plan
terraform apply
```

## 2: Run init to migrate tfstate to bucket
See https://www.terraform.io/docs/backends/init.html

```
mv state.tf.notyet state.tf
terraform init
```

## 3: Ensure to add a 'backend "s3"' config to your tf package

See https://www.terraform.io/docs/backends/types/s3.html

Example:
```
# Because of the assume_role is defined in provider,
# the last 3 lines should not be required.
# For some reason the authentication failed without it
# See https://github.com/hashicorp/terraform/issues/13589
terraform {
  backend "s3" {
    bucket       = "<USERID>-lab-tfstate-<ACCOUNT-ID>"
    key          = "global/s3/xxxx-tfstate/terraform.tfstate"
    dynamodb_table   = "<USERID>-lab-tfstate-<ACCOUNT-ID>"
    region       = "eu-west-1"
    role_arn     = "arn:aws:iam::<ACCOUNT-ID>:role/<YOUR-ROLE-ID>"
    session_name = "xxxx"
    external_id  = "xxxx"
  }
}
```

## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| costcenter | Cost center for cost allocation | - | yes |
| environment | Environment name | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| tf_state_bucket_arn |  |
| tf_state_bucket_domain_name |  |
| tf_state_bucket_id |  |
| tf_state_bucket_region |  |
| tf_state_lock_arn |  |
| tf_state_lock_id |  |
