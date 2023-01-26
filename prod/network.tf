module "prod_vpc" {
  source       = "../main/network"
  vpc_cidr     = "10.200.0.0/16"
  vpc_name     = "PROD-VPC"
  environment  = "prod"
  igw          = "PROD-IGW"
  Public_cidr  = ["10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"]
  Private_cidr = ["10.200.10.0/24", "10.200.20.0/24", "10.200.30.0/24"]
  azs          = ["us-east-1a", "us-east-1b", "us-east-1c"]

}