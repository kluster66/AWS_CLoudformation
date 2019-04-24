data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
  most_recent = true
}

# EC2 server test 01
resource "aws_instance" "server01"{
  count=2
  instance_type ="t2.micro"
  ami ="${lookup(var.aws_ami, var.aws_region)}"
  key_name = "${var.aws_key_name}"


  subnet_id = "${aws_subnet.public_subnet.id}"
  tags {
    Name = "Terraform_example"
  }
  security_groups = ["${aws_security_group.default.id}"]
#mise a jour de la vm et installation des packages
  user_data = <<-EOF
              #!bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo service httpd start
              EOF
}

output "ami_information" {
  value = "${data.aws_ami.web.image_id}"
}
