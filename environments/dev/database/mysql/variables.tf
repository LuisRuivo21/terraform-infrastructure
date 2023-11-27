# Project naming variable
#---------------------------------------
variable "project_name" {
  description = "Project name."
  type        = string
  default     = "luis-cloud-app"
}


# Environment variables
#---------------------------------------
variable "aws_region" {
  description = "The name of the region we are deploying to."
  type        = string
  default     = "eu-west-2"
}


# Database Username
#---------------------------------------
variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}


# Database Password
#---------------------------------------
variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
