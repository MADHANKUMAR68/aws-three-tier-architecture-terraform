output "launch_template_id" {
  value = aws_launch_template.app_lt.id
}

output "rds_endpoint" {
  value = aws_db_instance.app_db.endpoint
}
