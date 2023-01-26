module "dev_elb" {
  source        = "../main/elb"
  nlbname       = "Dev"
  subnets       = module.dev_vpc.Publicsubnet
  env           = module.dev_vpc.env
  tgname        = "Test"
  vpc_id        = module.dev_vpc.vpc_id
  PrivateServer = module.dev_ec2.PrivateServer
  #default_acm_certificate_arn="arn:aws:acm:us-east-1:447310505227:certificate/ecb1341c-9874-4f3c-b7fe-ba1c1a9012b1"
}