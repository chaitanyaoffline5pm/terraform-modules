resource "aws_subnet" "Public_subnet" {
    count = length(var.Public_cidr)
    vpc_id = aws_vpc.vpc_cgit.id
   cidr_block=element(var.Public_cidr,count.index)
   availability_zone = element(var.azs,count.index)
   map_public_ip_on_launch = true
   tags={
    Name="${var.vpc_name}_Public_Subnet_${count.index + 1}"
    environment=var.environment
   } 
}