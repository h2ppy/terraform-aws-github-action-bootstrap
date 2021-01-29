// To create sns subscription like with endpoints like sms, http, SQS etc.
// For email subscripton use file named email_sns_subscriptions.tf
resource "aws_sns_topic_subscription" "sms-subscription-name" {
  topic_arn = aws_sns_topic.chem101-prod-ALARM.arn
  protocol  = "sms"
  endpoint  = "+91XXXXX"
}