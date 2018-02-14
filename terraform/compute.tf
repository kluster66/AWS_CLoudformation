# EC2 server
resource "aws_instance" "server01"{
  instance_type ="t2.micro"
  ami ="${lookup(var.aws_ami, var.aws_region)}"
  key_name = "${var.aws_key_name}"
  security_groups = "${var.aws_security_group}"

#mise a jour de la vm et installation des packages
connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "${var.key_path}"
}

provisioner "remote-exec" {
  inline = [
    "sudo yum update"
  ]

}

}
