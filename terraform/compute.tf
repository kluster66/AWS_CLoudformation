resource "aws_instance" "server01"{
  instance_type ="t2.micro"
  ami ="${lookup(var.aws_ami, var.aws_region)}"
  key_name = "${var.aws_key_name}"
  security_group = "MyPublicSG"
}
