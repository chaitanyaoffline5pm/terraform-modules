resource "aws_eip" "nat_gw_eip" {
  vpc=true
}
resource "aws_nat_gateway" "natgw" {
allocation_id = aws_eip.nat_gw_eip.id
subnet_id = var.Public_subnet_id
tags = {
  "Name" = "${var.vpc_name}-NGW"
}
  
}
