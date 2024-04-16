variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "db_identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database. It is recommended to use a secret manager"
  type        = string
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs to launch in"
  type        = list(string)
}

resource "aws_db_instance" "default" {
  identifier        = var.db_identifier
  allocated_storage = var.db_allocated_storage
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name

  vpc_security_group_ids = [aws_security_group.default.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "default" {
  name        = "${var.db_identifier}-sg"
  description = "Managed by Terraform bla bla"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "db_instance_endpoint" {
  value = aws_db_instance.default.address
}
