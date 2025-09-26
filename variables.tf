# ----------------------
# AWS Region
# ----------------------
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# ----------------------
# S3 Buckets
# ----------------------
variable "metadata_bucket_name" {
  description = "S3 bucket name for metadata (highlights JSON)"
  type        = string
  default     = "sports-highlights-metadata"
}

variable "videos_bucket_name" {
  description = "S3 bucket name for raw and processed videos"
  type        = string
  default     = "sports-highlights-videos"
}

variable "logs_bucket_name" {
  description = "S3 bucket name for logs"
  type        = string
  default     = "sports-highlights-logs"
}

# ----------------------
# EC2 Configuration
# ----------------------
variable "ec2_instance_type" {
  description = "EC2 instance type for the pipeline"
  type        = string
  default     = "t3.micro"
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance (Amazon Linux 2)"
  type        = string
  default     = "ami-0c02fb55956c7d316" # us-east-1
}

# ----------------------
# RapidAPI Configuration
# ----------------------
variable "rapidapi_key" {
  description = "RapidAPI key for Sports Highlights API"
  type        = string
  sensitive   = true
}

variable "rapidapi_host" {
  description = "RapidAPI host for Sports Highlights API"
  type        = string
}

variable "league" {
  description = "League name to fetch highlights (e.g., NCAA)"
  type        = string
  default     = "NCAA"
}

# ----------------------
# MediaConvert Configuration
# ----------------------
variable "mediaconvert_role_arn" {
  description = "IAM role ARN for AWS MediaConvert"
  type        = string
}

# ----------------------
# EventBridge Schedule
# ----------------------
variable "schedule_expression" {
  description = "Cron expression for triggering the pipeline via EventBridge"
  type        = string
  default     = "cron(0 10 * * ? *)" # daily at 10:00 UTC
}

# ----------------------
# Optional SNS Topic
# ----------------------
variable "sns_topic_name" {
  description = "Optional SNS topic name for pipeline completion notifications"
  type        = string
  default     = ""
}
