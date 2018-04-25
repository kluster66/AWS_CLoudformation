resource "aws_iam_user" "students" {
  count = 3
  name = "${var.user_name_prefix}0${count.index}"
}

resource "aws_iam_policy" "policy" {
  name        = "students-policy"
  description = "A test policy"
  policy      = <<-EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": "ec2:RunInstances",
              "Resource": "arn:aws:ec2:eu-west-3:426877532519:instance/*",
              "Condition": {
                  "StringEquals": {
                      "ec2:InstanceType": "t2.micro"
                  }
              }
          },
          {
              "Sid": "VisualEditor1",
              "Effect": "Allow",
              "Action": "ec2:RunInstances",
              "Resource": "arn:aws:ec2:eu-west-3::image/ami-*",
              "Condition": {
                  "StringEquals": {
                      "ec2:Owner": "amazon"
                  }
              }
          },
          {
              "Sid": "VisualEditor2",
              "Effect": "Allow",
              "Action": [
                  "ec2:DescribeImages",
                  "ec2:DescribeInstances",
                  "ec2:DescribeVpcs",
                  "ec2:DescribeSubnets",
                  "ec2:DescribeKeyPairs",
                  "ec2:DescribeSecurityGroups"
              ],
              "Resource": "*"
          },
          {
              "Sid": "VisualEditor3",
              "Effect": "Allow",
              "Action": "ec2:RunInstances",
              "Resource": [
                  "arn:aws:ec2:eu-west-3:426877532519:volume/*",
                  "arn:aws:ec2:eu-west-3:426877532519:subnet/*",
                  "arn:aws:ec2:eu-west-3:426877532519:key-pair/*",
                  "arn:aws:ec2:eu-west-3:426877532519:network-interface/*",
                  "arn:aws:ec2:eu-west-3:426877532519:security-group/*"
              ]
          }
      ]
  }
  EOF
}

resource "aws_iam_group" "group" {
  name = "students-group"
}

resource "aws_iam_group_policy_attachment" "students-attachment" {
  group = "${aws_iam_group.group.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_group_membership" "team" {
  name = "students-group-membership"
  users = ["${aws_iam_user.students.*.name}"]

  group = "${aws_iam_group.group.name}"
}

resource "aws_iam_user_login_profile" "students" {
  count = "${length(aws_iam_user.students.*.name)}"
  user = "${element(aws_iam_user.students.*.name, count.index)}"
  pgp_key = "keybase:philippe"
}
