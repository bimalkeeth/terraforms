
resource "aws_iam_user" "user"{
  name = var.frb_user_names[count.index]
  count = 3
}