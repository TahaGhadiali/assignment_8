variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "ec2 single"
}

variable "flask_port" {
  default = 5000
}

variable "express_port" {
  default = 3000
}
