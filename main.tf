module "billing_alerts" {
  source    = "./billing_module"
  email     = "your-email@example.com"
  threshold = 75
  alarm_name = "testing_module_name_arg"
  sns_topic_name = "testing_topic_name_arg"
}


