# Purpose: Create an SNS topic billing alerts

resource "aws_sns_topic" "billing_alerts" {
  provider = aws.us_east_1
  name = "sns-topic-for-billing-alerts"
  tags = {
    terraform_managed = "true"
  }
}

# Subscription for the SNS topic to send email notifications to the user.
# resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
#   provider = aws.us_east_1
#   topic_arn = aws_sns_topic.billing_alerts.arn
#   protocol  = "email"
#   endpoint  = "your-email"
# }








































