output "users_name" {
  value = "${aws_iam_user.students.*.name}"
}

output "password" {
  value = "${aws_iam_user_login_profile.students.encrypted_password}"
}
