resource "aws_iam_user" "students" {
  count = 1
  name = "${var.user_name_prefix}0${count.index}"
  password = "initial"
  password_reset_required = "yes"

}


ressource "aws_iam_group" "students_group" {
  name = "students"
}
