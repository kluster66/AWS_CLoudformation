variable "aws_region" {
default = "eu-west-3"
}

variable "aws_ami" {
  default = {
        eu-west-3 = "ami-8ee056f3"
      }
}

variable "aws_key_name" {
<<<<<<< HEAD
  default ="zorglub"
=======
  default ="MyTerraformKey"
>>>>>>> fb7c8e575efefe2c9a9747181c24f7983351af25
}
