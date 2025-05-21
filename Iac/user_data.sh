#!/bin/bash
echo "Running user data script to install NGINX..." > /var/tmp/init.log
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "NGINX started via user data script" >> /var/tmp/init.log

