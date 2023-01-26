module "dev_vpc" {
  source       = "../main/network"
  vpc_cidr     = "10.100.0.0/16"
  vpc_name     = "Dev-Vpc"
  environment  = "Dev"
  igw          = "Dev-IGW"
  Public_cidr  = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  Private_cidr = ["10.100.10.0/24", "10.100.20.0/24", "10.100.30.0/24"]
  azs          = ["us-east-1a", "us-east-1b", "us-east-1c"]
  natgw_id     = module.dev_nat.nat_gw
}