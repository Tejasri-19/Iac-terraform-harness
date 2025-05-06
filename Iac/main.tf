resource "aws_instance" "demo" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (or use Ubuntu AMI if preferred)
  instance_type = "t2.micro"
  key_name      = "us-east-1-keypair" # Replace with your actual key pair name

  user_data = <<EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              echo "<h1>Deployed via Terraform user_data</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "harness-demo-instance"
  }
}
