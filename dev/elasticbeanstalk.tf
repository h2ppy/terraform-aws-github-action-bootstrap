//resource "aws_elastic_beanstalk_application" "chem101" {
//  name        = "chem101"
//  description = "chem101-ebs-app"
//}
//resource "aws_elastic_beanstalk_environment" "chem101-dev-api" {
//  name                = "chem101-dev-api"
//  application         = aws_elastic_beanstalk_application.chem101.name
//  solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.2 running Java 8"
//
//
//  setting {
//resource  = ""
//    name = "SPRING_PROFILES_ACTIVE"
//    namespace = "aws:elasticbeanstalk:application:environment"
//    value = "dev-api"
//  }
//
//  setting {
//resource  = ""
//    name = "VPCId"
//    namespace = "aws:ec2:vpc"
//    value = aws_vpc.happy-dev-vpc.id
//  }
//
//  setting {
//resource  = ""
//    name = "Subnets"
//    namespace = "aws:ec2:vpc"
//    value = "${aws_subnet.happy-dev-private-subnet-1a.id}, ${aws_subnet.happy-dev-private-subnet-1b.id}"
//  }
//
//  setting {
//resource  = ""
//    name = "ELBSubnets"
//    namespace = "aws:ec2:vpc"
//    value = "${aws_subnet.happy-dev-public-subnet-1a.id},${aws_subnet.happy-dev-public-subnet-1b.id}"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:autoscaling:launchconfiguration"
//    name = "SecurityGroups"
//    value = aws_security_group.chem101-dev-eb-instance-security-group.id
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:ec2:instances"
//    name = "InstanceTypes"
//    value = "t2.micro"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:managedactions"
//    name = "PreferredStartTime"
//    value = "MON:06:00"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:autoscaling:launchconfiguration"
//    name = "IamInstanceProfile"
//    value = "aws-elasticbeanstalk-ec2-role"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
//    name = "UpdateLevel"
//    value = "minor"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:autoscaling:asg"
//    name = "MinSize"
//    value = "2"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:autoscaling:asg"
//    name = "MaxSize"
//    value = "3"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
//    name = "StreamLogs"
//    value = true
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:environment"
//    name = "LoadBalancerType"
//    value = "application"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:environment"
//    name = "ServiceRole"
//    value = "aws-elasticbeanstalk-service-role"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:healthreporting:system"
//    name = "SystemType"
//    value = "enhanced"
//  }
//
//  setting {
//resource  = ""
//    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
//    name = "HealthStreamingEnabled"
//    value = true
//  }
//}
//
