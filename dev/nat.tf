module "dev_nat" {
  source           = "../main/nat"
  vpc_name         = module.dev_vpc.vpc_name
  Public_subnet_id = module.dev_vpc.Public_Subnet_1
}