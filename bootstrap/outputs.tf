output "tf_state_bucket_id" {
  value = "${aws_s3_bucket.tf_state_bucket.id}"
}

output "tf_state_bucket_arn" {
  value = "${aws_s3_bucket.tf_state_bucket.arn}"
}

output "tf_state_bucket_domain_name" {
  value = "${aws_s3_bucket.tf_state_bucket.bucket_domain_name}"
}

output "tf_state_bucket_region" {
  value = "${aws_s3_bucket.tf_state_bucket.region}"
}

output "tf_state_lock_arn" {
  value = "${aws_dynamodb_table.tf_state_lock.arn}"
}

output "tf_state_lock_id" {
  value = "${aws_dynamodb_table.tf_state_lock.id}"
}
