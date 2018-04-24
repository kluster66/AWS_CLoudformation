variable "aws_region" {
  default = "eu-west-3"
}

variable "aws_key_name" {
  default ="zorglub"
}

variable "key_path" {
  default = "/home/philippe/dev/aws/ssh_keys/zorglub/zorglub.pem"

}

variable "server_port" {
  description = "The port used by HTTP requests"
  default = 8080
}
