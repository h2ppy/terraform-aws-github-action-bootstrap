//resource "aws_vpc" "happy-dev-vpc" {
//  cidr_block = "10.10.0.0/16"
//  enable_dns_support = "true"
//  enable_dns_hostnames = "false"
//  enable_classiclink = "false"
//  instance_tenancy = "default"
//  tags = {
//    Name = "happy-dev-vpc"
//  }
//}
//
//
//resource "aws_main_route_table_association" "happy-dev-vpc-main-rt-association" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//  route_table_id = aws_route_table.dev-rt-nat.id
//}