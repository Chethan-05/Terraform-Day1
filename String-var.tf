resource "aws_instance" "APP" {
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
   
}


variable "ami_id" {
    description = "Storing AMI value"
    type = string
    default = "ami-0b09ffb6d8b58ca91"
  
}

variable "instance_type" {
    description = "Storing Instance type"
    type = string
    default = "t2.micro"
  
}

variable "availability_zone" {
    description = "Storing availability zone "
    type = string
    default = "us-east-1a"
  
}
