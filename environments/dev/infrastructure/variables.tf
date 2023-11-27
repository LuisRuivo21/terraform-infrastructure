# Project naming variable
#---------------------------------------
variable "project_name" {
  description = "Project name."
  type        = string
  default     = "luis-cloud-app"
}


# Environment variable
#---------------------------------------
variable "environment" {
  type    = string
  default = "Dev"
}


# Region variable
#---------------------------------------
variable "aws_region" {
  type    = string
  default = "eu-west-2"
}
