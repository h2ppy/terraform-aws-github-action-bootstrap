module "sns-subscription" {
  source = "../email_sns_subscription_module"
  email = "happy@101edu.co"
  sns_topic_arn = aws_sns_topic.alarm_email_list.arn
}