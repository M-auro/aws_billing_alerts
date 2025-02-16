module "billing_alerts" {
  source         = "./billing_module"
  email          = var.email
  threshold      = var.threshold
  alarm_name     = var.alarm_name
  sns_topic_name = var.sns_topic_name
  create_kms_key = var.create_kms_key
}


