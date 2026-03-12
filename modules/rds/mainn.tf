resource "aws_db_instance" "this" {
  identifier     = var.db_identifier
  engine         = "mysql"
  instance_class = var.instance_class

  allocated_storage = 20
  username          = var.db_user
  password          = var.db_password

  skip_final_snapshot = true
}
