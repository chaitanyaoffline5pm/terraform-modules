resource "aws_subnet" "Private_subnet" {
    count = length(var.Private_cidr)
    vpc_id = aws_vpc.vpc_cgit.id
   cidr_block=element(var.Private_cidr,count.index)
   availability_zone = element(var.azs,count.index)
   tags={
    Name="${var.vpc_name}_Private_Subnet_${count.index + 1}"
    environment=var.environment
   } 
}