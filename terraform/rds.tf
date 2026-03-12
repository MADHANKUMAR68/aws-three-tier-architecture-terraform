resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "three-tier-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "three-tier-db-subnet-group"
  }
}

resource "aws_db_instance" "app_db" {
  identifier = "three-tier-mysql-db"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "appdb"
  username = "admin"
  password = "Password123!"

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "three-tier-rds"
  }
}
