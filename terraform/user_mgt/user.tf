resource "aws_iam_user" "students" {
  count = 1
  name = "${var.user_name_prefix}0${count.index}"

}

resource "aws_iam_user_policy" "st_policy" {
  user = "${aws_iam_user.students.name}"
  policy = <<EOF {
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
