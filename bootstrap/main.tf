provider "aws" {
  region = "eu-west-1"
  assume_role {
    role_arn       = "arn:aws:iam::<ACCOUNT-ID>:role/<YOUR-ROLE-ID>"
    session_name   = "<YOUR-SESSION-ID>"    
  }
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "${var.tf_state_bucket}"
  acl    = "private"
  
  server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "aws:kms"
        }
      }
    }
  
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name        = "Terraform state bucket"
    Environment = "${var.environment}"
    CostCenter  = "${var.costcenter}"
  }
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name           = "${var.tf_state_lock}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name        = "Terraform state lock table"
    Environment = "${var.environment}"
    CostCenter  = "${var.costcenter}"
  }
}
