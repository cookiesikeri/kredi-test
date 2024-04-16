resource "aws_db_instance" "default" {
  allocated_storage      = 10
  identifier             = "example-rds"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.m5.large"
  username               = "user"
  password               = "pass"
 parameter_group_name    = "default.mysql5.7"
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.subnet-grp.name
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  skip_final_snapshot    = true
}