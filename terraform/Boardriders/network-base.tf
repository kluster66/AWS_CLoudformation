###################################################
# Auteur: Boardriders    Date: 24/04/2019
#
# Description:
# 1 VPC avec 2 subnets ( 1 public, 1 privé)
# 1 security group ssh+http+sapgui
#
# Commentaires:
#
###################################################

#On cree les Security group
resource "aws_security_group" "default" {
    name = "tf-brds-sg"
    vpc_id      = "${aws_brds_vpc.main.id}"
    description = "Allow ssh and web access"

    # RDP access (on est sous windows quand même)
    ingress {
      from port = 3389
      to port = 3389
      protocol ="rdp"
      cidr_block = ["0.0.0.0/0"]
    }
    # SSH access from anywhere
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # HTTP access from anywhere
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    #saplogon access from anywhere
    ingress {
      from_port = 3200
      to_port = 3399
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

#on cree le VPC Boardriders
resource "aws_brds_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  tags {
    Name = "Boardriders_VPC"
  }
}

# on cree le public subnet avec acces au net
resource "aws_brds_subnet" "public_subnet" {
  vpc_id = "${aws_brds_vpc.main.id}"
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-3a"
  tags {
    Name = "BrdsPublicSubnet"
  }
}

# on cree le private subnet sans acces au net
resource "aws_brds_subnet" "private_subnet" {
  vpc_id = "${aws_brds_vpc.main.id}"
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "eu-west-3b"
  tags {
    Name = "BrdsPrivateSubnet"
  }
}
