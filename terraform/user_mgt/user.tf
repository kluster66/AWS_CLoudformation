resource "aws_iam_user" "students" {
  count = 1
  name = "${var.user_name_prefix}0${count.index}"
}
