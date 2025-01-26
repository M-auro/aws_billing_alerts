#Billing metric data is stored in the US East (N. Virginia) Region and represents worldwide charges.
# Configure the AWS Provider

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}




# CloudWatch metric alarm that monitors the estimated charges for the AWS account.
resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  provider            = aws.us_east_1
  depends_on          = [aws_sns_topic.billing_alerts]
  alarm_description   = "This metric monitors the estimated charges for the AWS account"
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 86400 # 1 day
  statistic           = "Maximum"
  threshold           = var.threshold
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }

  tags = {
    terraform_managed = "true"
  }
}

# SNS topic for billing alerts
resource "aws_sns_topic" "billing_alerts" {
  provider          = aws.us_east_1
  name              = var.sns_topic_name
  kms_master_key_id = var.create_kms_key ? aws_kms_key.billing_key[0].id : null # Optional, if you want to use a customer-managed KMS key
  tags = {
    terraform_managed = "true"
  }
}

# Subscription for the SNS topic to send email notifications to the user.
resource "aws_sns_topic_subscription" "subscription_email" {
  provider  = aws.us_east_1
  topic_arn = aws_sns_topic.billing_alerts.arn
  protocol  = "email"
  endpoint  = var.email
}

# Create a customer kms key for the sns topic
resource "aws_kms_key" "billing_key" {
  count                   = var.create_kms_key ? 1 : 0 # default is false
  provider                = aws.us_east_1
  description             = "KMS key for SNS topic"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  tags = {
    terraform_managed = "true"
  }
}

