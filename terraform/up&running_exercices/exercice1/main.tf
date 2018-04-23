ressource "aws_instance" "example" {
  ami           = "ami-8ee056f3"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "hello world" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
