variable "sns_topic_arn" {
}

variable "email" {
}

data "template_file" "aws_cf_sns_stack" {
  template = file("../templates/cf_aws_sns_email_stack.json.tpl")
  vars = {
    email = var.email
    sns_topic_arn = var.sns_topic_arn
  }
}

resource "aws_cloudformation_stack" "email_sns_subscription" {
  name = "emailSnsSubscription"
  template_body = data.template_file.aws_cf_sns_stack.rendered
}