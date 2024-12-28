resource "aws_iam_user" "file_user" {
  name = "demo-user-user"
}

resource "aws_iam_user_policy" "user_role" {
  name = "ec2-user-policy"
  user = aws_iam_user.file_user.name
  policy = file("iam_user_policy.json")
}