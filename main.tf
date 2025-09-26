
resource "aws_s3_bucket" "metadata" {
  bucket = "sports-highlights-metadata-12345"
}

resource "aws_s3_bucket" "videos" {
  bucket = "sports-highlights-videos-12345"
}

resource "aws_s3_bucket" "logs" {
  bucket = "sports-highlights-logs-12345"
}


resource "aws_iam_role" "ec2_role" {
  name = "pipeline-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "pipeline-ec2-profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_instance" "pipeline_ec2" {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}

resource "aws_cloudwatch_event_rule" "daily_trigger" {
  name                = "pipeline-daily-trigger"
  description         = "Trigger the sports highlights pipeline daily"
  schedule_expression = "cron(0 10 * * ? *)"
}
