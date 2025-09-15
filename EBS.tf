resource "aws_ebs_volume" "exercise1" {

    availability_zone = "us-east-1b"
    size = 8
    tags = {
      Name = "Sample"
    }
  
}
