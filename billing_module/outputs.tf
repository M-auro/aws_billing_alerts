output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.billing_alarm.alarm_name
}

output "kms_key_id" {
  value = length(aws_kms_key.billing_key) > 0 ? aws_kms_key.billing_key[0].id : ""
}