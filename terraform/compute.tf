resource "aws_instance" "server01"{
  instance_type ="t2.micro"
  ami ="${lookup(var.aws_ami, var.aws_region)}"

}