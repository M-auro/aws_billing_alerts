variable "alarm_name" {
  description = "The name of the CloudWatch alarm"
  type        = string
  default     = "BillingAlarm"
}

variable "threshold" {
  description = "The threshold for the CloudWatch alarm"
  type        = number
  default     = 75.0
}

variable "sns_topic_name" {
  description = "The name of the SNS topic"
  type        = string
  default     = "sns-topic-for-billing-alerts"
}

variable "email" {
  description = "The email address for SNS notifications"
  type        = string
  default     = "your-email@example.com"
}
