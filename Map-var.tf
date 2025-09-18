resource "aws_instance" "name" {

  
}

variable "ec2_tags" {
    type = map(string)
    default = {
      Name = "CServer"
      Env = "devoloper"
      Place = "Tpt"
    }
  
}
