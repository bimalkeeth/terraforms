
resource "aws_instance" "aws_example" {
  tags = {
    Name = "ExampleInstance" # Tag the instance with a Name tag for easier identification
  }
}