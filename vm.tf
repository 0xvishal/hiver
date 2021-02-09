# Define common EC2 the private subnet
resource "aws_instance" "prod-web-server-1" {
   ami  = "ami-073c8c0760395aab8"
   instance_type = "t2.nano"
   key_name = aws_key_pair.deployer.id
   subnet_id = var.private-subnet1
   vpc_security_group_ids = [aws_security_group.public.id]
   #associate_public_ip_address = true
   
   user_data = <<USER_DATA
#!/bin/bash
sudo apt-get update
sudo hostname prod-web-server-1
sudo echo "prod-web-server-1" > /etc/hostname
sudo echo "127.0.0.1 prod-web-server-1" >> /etc/hosts
   USER_DATA
   tags = {
    Name = "prod-web-server-1"
  }
 
}

# Define common EC2 in the private subnet
resource "aws_instance" "prod-web-server-2" {
   ami  = "ami-073c8c0760395aab8"
   instance_type = "t2.nano"
   key_name = aws_key_pair.deployer.id
   subnet_id = var.private-subnet2
   vpc_security_group_ids = [aws_security_group.public.id]
   #associate_public_ip_address = true
   user_data = <<USER_DATA
#!/bin/bash
sudo apt-get update
sudo hostname prod-web-server-2
sudo echo "prod-web-server-2" > /etc/hostname
sudo echo "127.0.0.1 prod-web-server-2" >> /etc/hosts
   USER_DATA
   tags = {
    Name = "prod-web-server-2"
  }
}
