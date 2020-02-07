# Input variables

variable "environment" {
  description = "Environment name"
}

variable "costcenter" {
  description = "Cost center for cost allocation"
}

variable "tf_state_bucket" {
  description = "Bucket name for state"
}

variable "tf_state_lock" {
  description = "DynamoDB name for stateLock"
}
