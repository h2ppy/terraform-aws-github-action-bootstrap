resource "aws_elastic_beanstalk_environment" "chem101Env" {
  name = var.environment_name
  application = var.application_name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.2 running Java 8"

  setting {
    resource = ""
    name = "SPRING_PROFILES_ACTIVE"
    namespace = "aws:elasticbeanstalk:application:environment"
    value = var.spring_profile
  }

  setting {
    resource = ""
    name = "VPCId"
    namespace = "aws:ec2:vpc"
    value = var.vpcId
  }

  setting {
    resource = ""
    name = "Subnets"
    namespace = "aws:ec2:vpc"
    value = join(",", sort(var.private_subnets))
  }

  setting {
    resource = ""
    name = "ELBSubnets"
    namespace = "aws:ec2:vpc"
    value = join(",", sort(var.public_subnets))
  }

  setting {
    resource = ""
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = var.ec2_key_pair_name
  }

  setting {
    resource = ""
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = var.eb_instance_security_group
  }

  setting {
    resource = ""
    namespace = "aws:ec2:instances"
    name = "InstanceTypes"
    value = var.instanceType
  }

  setting {
    resource = ""
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name = "UpdateLevel"
    value = var.platform_update_level
  }

  setting {
    resource = ""
    namespace = "aws:elasticbeanstalk:managedactions"
    name = "PreferredStartTime"
    value = var.minor_update_preferred_start_time
  }

  setting {
    resource = ""
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = var.iam_instance_ec2_role
  }

  setting {
    resource = ""
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = var.autoscaling_minimum_capacity
  }

  setting {
    resource = ""
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = var.autoscaling_maximum_capacity
  }

  setting {
    resource = ""
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name = "StreamLogs"
    value = true
  }

  setting {
    resource = ""
    namespace = "aws:elasticbeanstalk:environment"
    name = "LoadBalancerType"
    value = "application"
  }

//  setting {
//    resource = ""
//    namespace = "aws:elasticbeanstalk:environment"
//    name = "ServiceRole"
//    value = var.service_role
//  }

  setting {
    resource = ""
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name = "SystemType"
    value = var.health_reporting_systemType
  }

  setting {
    resource = ""
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name = "HealthStreamingEnabled"
    value = var.health_streaming_enabled
  }
}