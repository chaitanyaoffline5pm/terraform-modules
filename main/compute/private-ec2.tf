
resource "aws_instance" "Private_servers" {
    count=var.environment=="prod"  ? 3:2
    ami=lookup(var.amis,var.region)
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = element(var.PrivateSubnet,count.index)
    vpc_security_group_ids =[ var.sg_id]
    tags={
        Name="${var.vpc_name}-Privateserver-${count.index+1}"
        environment="${var.environment}"
    }

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y
service nginx start
apt install git -y
git clone -b test https://github.com/chaitanyadurgasoft/website.git
rm -rf /var/www/html/index.nginx-debian.html
cp website/index.html /var/www/html/
cp website/aws.png  /var/www/html/
cp website/cloud.jpg /var/www/html/
echo "<h1>"${var.vpc_name}-Private-server-${count.index+1}</h1>" >> /var/www/html/index.html
EOF

}
