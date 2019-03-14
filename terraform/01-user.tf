#
# IAM user for accessing app resources
#
resource "aws_iam_user" "app_user" {
  name = "${var.app_user}"
  tags = {
    Name      = "Correspondence Tool user ${var.app_user}"
    Terraform = "true"
  }
}
