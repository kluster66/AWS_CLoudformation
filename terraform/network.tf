# Security group
resource "aws_security_group" "default" {
    name = "tf-demo-sg"
    vpc_id      = "${aws_vpc.main.id}"
    description = "Allow ssh and web access"

    # SSH access from anywhere
    ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = ["tf-demo-sg"]
    }
    # HTTP access from anywhere
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = ["tf-demo-sg"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      security_groups = ["tf-demo-sg"]
    }
}

resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  tags {
    Name = "My_Paris_VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = "true"
  tags {
    Name = "MyPublicSubnet"
  }
}
