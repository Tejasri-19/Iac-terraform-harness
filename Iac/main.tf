resource "aws_instance" "web" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  user_data = <<EOF
#!/bin/bash
echo "User data script started" > /var/tmp/init.log
yum update -y
amazon-linux-extras install -y nginx1
systemctl start nginx
systemctl enable nginx
echo "NGINX installed and started" >> /var/tmp/init.log
EOF

  tags = {
    Name = "nginx-inline-script"
  }
}

