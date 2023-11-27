# Database Address Output
#---------------------------------------
output "db_address" {
  description = "Connect to the database at this endpoint."
  value       = aws_db_instance.default_db.address
}



# Database Port Output
#---------------------------------------
output "db_port" {
  description = "The port the database is listening on."
  value       = aws_db_instance.default_db.port
}
