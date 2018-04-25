resource "aws_iam_user" "students" {
  count = 1
  name = "${var.user_name_prefix}0${count.index}"
}

resource "aws_iam_policy" "policy" {
  name        = "students-policy"
  description = "A test policy"
  policy      = # omitted
}
