module "rds" {
  source = "./rds"

  db_instance_class    = "db.t3.large"
  db_allocated_storage = 20
  db_engine            = "mysql"
  db_engine_version    = "8.0"
  db_identifier        = "mydbinstance"
  db_username          = "adminuser"
  db_password          = "adminpassword123"
  subnet_ids           = subnet_ids = module.vpc.private_subnets
  vpc_id               = module.vpc.vpc_id
}