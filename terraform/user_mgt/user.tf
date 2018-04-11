resource "aws_iam_user" "students" {
  name = "user-${var.user_name_prefix}-01"
}
