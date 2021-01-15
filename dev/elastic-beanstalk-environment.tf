module "base" {
  source = "../modules"
  spring_profile = "dev2-api"
  private_subnets = [aws_subnet.happy-dev-private-subnet-1a.id, aws_subnet.happy-dev-private-subnet-1b.id]
  public_subnets = [aws_subnet.happy-dev-public-subnet-1a.id, aws_subnet.happy-dev-public-subnet-1b.id]
  eb_instance_security_group = aws_security_group.chem101-dev-eb-instance-security-group.id
  instanceType = "t2.micro"
  minor_update_preferred_start_time = "MON:06:00"
  iam_instance_ec2_role = "aws-elasticbeanstalk-ec2-role"
  platform_update_level = "minor"
  autoscaling_minimum_capacity = "2"
  autoscaling_maximum_capacity = "3"
  service_role = "aws-elasticbeanstalk-service-role"
  health_reporting_systemType = "enhanced"
  health_streaming_enabled = true
  environment_name = "chem101-dev2-api"
  application_name = "chem101"
  vpcId = "vpc-0639e187a0fe017dc"
}