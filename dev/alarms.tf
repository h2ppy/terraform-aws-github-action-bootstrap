//// the sns does not support email endpoints hence the creation of sns and its subscription has to be done manually
//resource "aws_cloudwatch_metric_alarm" "chem101-prod-GroupInServiceInstances-HIGH-WARN" {
//  alarm_name = "chem101-prod-GroupInServiceInstances-HIGH-WARN"
//  metric_name = "GroupInServiceInstances"
//  statistic = "Maximum"
//  namespace = "AWS/AutoScaling"
//  evaluation_periods = "2"
//  comparison_operator = "GreaterThanThreshold"
//  period = 300
//  treat_missing_data = "ignore"
//  actions_enabled     = "true"
//  alarm_actions       = [aws_sns_topic.alarm_email_list.arn]
//  ok_actions          = [aws_sns_topic.alarm_email_list.arn]
//  threshold = 10
//  dimensions = {
//    AutoScalingGroupName  = module.base.aws_elastic_beanstalk_environment_autoscaling_groups[0]
//  }
//}
//
//resource "aws_cloudwatch_metric_alarm" "chem101-prod-RequestCount-HIGH-WARN" {
//  alarm_name = "chem101-prod-RequestCount-HIGH-WARN"
//  metric_name = "RequestCount"
//  statistic = "Sum"
//  namespace = "AWS/ApplicationELB"
//  evaluation_periods = "2"
//  comparison_operator = "GreaterThanThreshold"
//  period = 300
//  treat_missing_data = "ignore"
//  threshold = 75000
//  alarm_actions       = [aws_sns_topic.alarm_email_list.arn]
//  ok_actions          = [aws_sns_topic.alarm_email_list.arn]
//  dimensions = {
//    LoadBalancer  = module.base.aws_elastic_beanstalk_environment_load_balancers[0]
//  }
//}