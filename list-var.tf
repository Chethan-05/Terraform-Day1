resource "aws_iam_user" "dev" {
    name = var.list_iam[count.index]
    count = length(var.list_iam)

  
}

variable "list_iam" {
    description = "value"
    type = list(string)
    default = [ "Chethan","Vinayak","Prakash" ]
  
}
