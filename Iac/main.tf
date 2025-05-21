resource "aws_instance" "demo" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "harness-demo-instance"
  }
}
