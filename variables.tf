# Define AWS as our provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "hiver"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZrycl/CPaP9eYpTTe257vMtTG/F/u3mrVbNtiq2WrTYdw+EZqEfplXKHOzsndHazvy9xH9tWHfb09uytfdxcvqwdfgbnm45th8ujn6ygb4rf3edc3erghnf3iZoWFqUXGVRlkjhgfdzxcvbnmloiuytresxcvbklgfgfKnWNmgCUEX5hzuqwfxG3IJ9EP9YoK159wW6kA0hZEOGQKo/ESlwrllkM0PGaFBr0hJ9li9pW7SRazwiFlWactvkzV3Ngm1ZTAlnjMV9S/4EU6lkjytrewazxcvkl9876reshQezPLiSbcWNA5d0el0Y7svBNl3WwiytCEevKsUkezGNswbZUZ8+oA98kjytrdsxcvbnkuyU5HQmTv vishal@vishals-MacBook-Air.local"
}

variable "private-subnet1" {
  description = "Private subnet of default VPC"
  default = "subnet-0qd5sc12"
}

variable "private-subnet2" {
  description = "Private subnet of default VPC"
  default = "subnet-f7v5s1z0"
}

variable "vpc" {
  description = "Default VPC"
  default = "vpc-12u74k1b"
}




