# EC2 server
resource "aws_instance" "server01"{
  instance_type ="t2.micro"
  ami ="${lookup(var.aws_ami, var.aws_region)}"
  key_name = "${var.aws_key_name}"
  security_groups = "${var.aws_security_group}"

  subnet_id = "${aws_subnet.public_subnet.id}"
  tags {
    Name = "Terraform_example"
  }
#mise a jour de la vm et installation des packages
  user_data = <<-EOF
              #!bin/bash
              sudo yum update
              sudo yum install http
              EOF
}
