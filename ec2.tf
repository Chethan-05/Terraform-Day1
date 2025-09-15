provider "aws" {
    region = "us-east-1"
  
}


resource "aws_instance" "webserver" {

    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = "t2.micro"
    availability_zone = "us-east-1b"

    tags = {
      Name = "Test"
      Name = "tpt"
    }
}
