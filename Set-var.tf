resource "aws_iam_group" "jhc" {
    name = each.value
    for_each = toset(var.iam_groups)
  
}

variable "iam_groups" {
    type = set(string)
    default = [ "Dev_grp","Prod_grp" ]

  
}
