resource "aws_autoscaling_policy" "ASGAverageCPUUtilization" {
  name                   = "ASGAverageCPUUtilization"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 90
  autoscaling_group_name = module.base.aws_elastic_beanstalk_environment_autoscaling_groups[0]
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 5
  }
}

data "external" "target-group-arn" {
  program = ["bash", "./get_target_group_from_load_balancer.sh"]
  query = {
    load_balancer_arn = module.base.aws_elastic_beanstalk_environment_load_balancers[0]
  }
}

resource "aws_autoscaling_policy" "ALBRequestCountPerTarget" {
  name                   = "ALBRequestCountPerTarget"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 90
  autoscaling_group_name = module.base.aws_elastic_beanstalk_environment_autoscaling_groups[0]
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label = data.external.target-group-arn.result
//      resource_label = format("%s/%s",split("loadbalancer/", split(":", module.base.aws_elastic_beanstalk_environment_load_balancers[0])[5])[1], split(":", trimspace(data.local_file.target_group_arn_in_local.content))[5])
    }
    target_value = 5
  }
  depends_on = [data.local_file.target_group_arn_in_local]
}


resource "aws_autoscaling_policy" "ASGAverageNetworkIn" {
  name                   = "ASGAverageNetworkIn"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 90
  autoscaling_group_name = module.base.aws_elastic_beanstalk_environment_autoscaling_groups[0]
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageNetworkIn"
    }

    target_value = 140000000
  }
}

resource "aws_autoscaling_policy" "ASGAverageNetworkOut" {
  name                   = "ASGAverageNetworkOut"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 90
  autoscaling_group_name = module.base.aws_elastic_beanstalk_environment_autoscaling_groups[0]
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageNetworkOut"
    }

    target_value = 24000000
  }
}