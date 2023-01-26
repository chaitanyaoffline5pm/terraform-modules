resource "aws_vpc" "vpc_cgit"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    tags={
        Name=var.vpc_name
        env=var.environment
    }
}
resource "aws_internet_gateway" "Igw_cgit" {
    vpc_id = aws_vpc.vpc_cgit.id
    tags = {
      "Name" = var.igw
    }
  
}