###################################################
# auteur: Boardriders    Date: 24/04/2019
#
# description: liste des variables pour deployer
# le SI SAP Sandbox
#
# commentaires: On est pas sorti des ronces
###################################################

variable "aws_region" {
default = "eu-west-3"
}

variable "aws_ami" {
  default = {
        eu-west-3 = "ami-8ee056f3"
      }
}

variable "aws_key_name" {
  default ="boardriders"
}

variable "aws_security_group" {
  default = ["tf-boardriders-sg"]
}

variable "key_path" {
    default = "C:\Users\pbazerbe\OneDrive\Documents\00_Pro\XX_Terraform\ssh\boardriders\boardriders.pem"

}
