
resource "aws_route_table" "Public_route" {
  vpc_id = aws_vpc.vpc_cgit.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Igw_cgit.id
  }
  tags = {
    Name = "${var.vpc_name}-PublicRoute"
  }
}
resource "aws_route_table" "Private_route" {
  vpc_id = aws_vpc.vpc_cgit.id
 route  {
 cidr_block="0.0.0.0/0"
   nat_gateway_id = var.natgw_id
 }
  tags = {
    Name = "${var.vpc_name}-PrivateRoute"
  }
}

resource "aws_route_table_association" "Public_association" {
  count          = length(var.Public_cidr)
  subnet_id      = element(aws_subnet.Public_subnet.*.id, count.index)
  route_table_id = aws_route_table.Public_route.id
}
resource "aws_route_table_association" "Private_association" {
  count          = length(var.Private_cidr)
  subnet_id      = element(aws_subnet.Private_subnet.*.id, count.index)
  route_table_id = aws_route_table.Private_route.id
}