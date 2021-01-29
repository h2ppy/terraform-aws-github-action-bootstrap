//resource "aws_subnet" "happy-dev-public-subnet-1a" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//  cidr_block = "10.10.100.0/24"
//  availability_zone = "us-east-1a"
//  tags = {
//    Name = "happy-dev-public-subnet-1a"
//  }
//}
//
//resource "aws_subnet" "happy-dev-public-subnet-1b" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//  cidr_block = "10.10.200.0/24"
//  availability_zone = "us-east-1b"
//  tags = {
//    Name = "happy-dev-public-subnet-1b"
//  }
//}
//
//resource "aws_subnet" "happy-dev-private-subnet-1a" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//  cidr_block = "10.10.10.0/24"
//  availability_zone = "us-east-1a"
//  tags = {
//    Name = "happy-dev-private-subnet-1a"
//  }
//}
//
//resource "aws_subnet" "happy-dev-private-subnet-1b" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//  cidr_block = "10.10.20.0/24"
//  availability_zone = "us-east-1b"
//  tags = {
//    Name = "happy-dev-private-subnet-1b"
//  }
//}