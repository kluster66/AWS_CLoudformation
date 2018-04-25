output "users_name" {
  value = "${aws_iam_user.students.*.name}"
}
