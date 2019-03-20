resource "aws_s3_bucket" "cts_resources" {
  bucket = "ms-${var.bucket_name_suffix}"
  tags {
    Name      = "CTS Resources for ${var.bucket_name_suffix}"
    Terraform = "true"
  }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.base_vhost_url}"]
    max_age_seconds = 3000
  }

}

resource "aws_iam_user_policy" "cts_resources_user_policy" {
  name       = "${var.bucket_name_suffix}-user-policy"
  user       = "${var.app_user}"
  depends_on = ["aws_iam_user.app_user", "aws_s3_bucket.cts_resources"]
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAllS3ActionsFor${var.app_user}",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::ms-${var.bucket_name_suffix}/*"
            ]
        },
        {
            "Sid": "AllowReadingFor${var.app_user}",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::ms-${var.bucket_name_suffix}"
            ]
        }
    ]
}
EOF
}
