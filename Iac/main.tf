resource "aws_instance" "demo" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (or use Ubuntu AMI if preferred)
  instance_type = "t2.micro"
  key_name      = "us-east-1-keypair" # Replace with your actual key pair name

  user_data = templatefile("${path.module}/user_data.sh", {})


  tags = {
    Name = "harness-demo-instance"
  }
}
