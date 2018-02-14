variable "aws_region" {
default = "eu-west-3"
}

variable "aws_ami" {
  default = {
        eu-west-3 = "ami-8ee056f3"
      }
}

variable "aws_key_name" {
  default ="zorglub"
}

variable "aws_security_group" {
  default = ["MyPublicSG"]
}
