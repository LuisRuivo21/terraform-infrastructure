# Project naming variable
#---------------------------------------
variable "project_name" {
  description = "Project name."
  type        = string
  default     = "luis-cloud-app"
}


# S3 Bucket variables
#----------------------------------------
variable "s3_bucket_name" {
  description = "The name of the S3 bucket (must be globally unique)."
  type        = string
  default     = "luis-cloud-app-terraform-state-backend"
}


# DynamoDB Table variables
#----------------------------------------
variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table (must be unique in this AWS account)."
  type        = string
  default     = "dynamodb-terraform-state-lock-table"
}
