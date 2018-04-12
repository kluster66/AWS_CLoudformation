resource "aws_iam_user" "students" {
  count = 1
  name = "${var.user_name_prefix}0${count.index}"
}


ressource "aws_iam_group" "students_group" {
  name = "students"
}

resource "aws_iam_user_login_profile" "students" {
  user = "${aws_iam_user.students.name}"
  pgp_key ) "keybase:philippe"
}

output "password" {
  value = "${aws_iam_user_login_profile.students.encrypted_password}"
}
