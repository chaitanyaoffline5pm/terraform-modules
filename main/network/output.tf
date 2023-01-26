output "vpc_id" {
    value = aws_vpc.vpc_cgit.id
}
output "vpc_name" {
    value = var.vpc_name
}
output "env" {
    value = var.environment
}
output "Publicsubnet"{
    value=aws_subnet.Public_subnet.*.id
}
output "Privatesubnet"{
    value=aws_subnet.Private_subnet.*.id
}
output "Public_Subnet_1"{
    value = aws_subnet.Public_subnet.0.id
}