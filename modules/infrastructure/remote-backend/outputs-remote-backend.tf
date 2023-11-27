# S3 Bucket Output
#----------------------------------------
output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.terraform_state.arn
}



# DynamoDB Table Output
#----------------------------------------
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table."
  value       = aws_dynamodb_table.terraform_locks.name
}
