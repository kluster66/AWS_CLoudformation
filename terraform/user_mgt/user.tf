resource "aws_iam_user" "students" {
  count = 3
  name = "user-${var.user_name_prefix}-${count.index}"
}
