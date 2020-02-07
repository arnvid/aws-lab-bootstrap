# Because of the assume_role defined in provider,
# the last 3 lines should not be required.
# For some reason the authentication failed without it
# See https://github.com/hashicorp/terraform/issues/13589
terraform {
  backend "s3" {
    bucket         = "<USERID>-lab-tfstate-<ACCOUNT-ID>"
    key            = "global/s3/lab-tfstate/terraform.tfstate"
    dynamodb_table = "<USERID>-lab-tfstate-<ACCOUNT-ID>"
    region         = "eu-west-1"
    role_arn       = "arn:aws:iam::<ACCOUNT-ID>:role/<YOUR-ROLE-ID>"
    session_name   = "<YOUR-SESSION-ID>"
  }
}
