# CloudWatch metric alarm that monitors the estimated charges for the AWS account.

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  provider            = aws.us_east_1
  depends_on          = [aws_sns_topic.billing_alerts]
  alarm_description   = "This metric monitors the estimated charges for the AWS account"
  alarm_name          = "BillingAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 86400 # 1 day
  statistic           = "Maximum"
  threshold           = 75.0 # 75 USD
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }

  tags = {
    terraform_managed = "true"
  }

}