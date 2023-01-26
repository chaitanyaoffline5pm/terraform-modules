module "prod_ec2" {
  source      = "../main/compute"
  environment = module.prod_vpc.env
  amis = {
    "us-east-1" = "ami-0778521d914d23bc1"
    "us-east-2" = "ami-0ab0629dba5ae551d"
  }
  region        = var.region
  instance_type = "t2.micro"
  key_name      = "AWSB1ONLINE-KEY"
  PublicSubnet  = module.prod_vpc.Publicsubnet
  sg_id         = module.Prod_sg.sg_id
  vpc_name      = module.prod_vpc.vpc_name
}