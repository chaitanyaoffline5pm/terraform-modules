output PublicServer {
    value = aws_instance.Public_servers.*.id
}
output PrivateServer {
    value = aws_instance.Private_servers.*.id
}
