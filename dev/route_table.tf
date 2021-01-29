//resource "aws_route_table" "dev-rt-nat" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//
//  route {
//    cidr_block = "0.0.0.0/0"
//    nat_gateway_id = aws_nat_gateway.happy-dev-nat.id
//  }
//  tags = {
//    Name = "dev-rt-nat"
//  }
//}
//
//resource "aws_route_table" "dev-rt-igw" {
//  vpc_id = aws_vpc.happy-dev-vpc.id
//
//  route {
//    cidr_block = "0.0.0.0/0"
//    gateway_id = aws_internet_gateway.happy-dev-internet-gateway.id
//  }
//  tags = {
//    Name = "dev-rt-igw"
//  }
//}
//
//resource "aws_route_table_association" "happy-dev-public-subnet-1a-association" {
//  subnet_id = aws_subnet.happy-dev-public-subnet-1a.id
//  route_table_id = aws_route_table.dev-rt-igw.id
//}
//
//resource "aws_route_table_association" "happy-dev-public-subnet-1b-association" {
//  subnet_id = aws_subnet.happy-dev-public-subnet-1b.id
//  route_table_id = aws_route_table.dev-rt-igw.id
//}
//
//resource "aws_route_table_association" "happy-dev-private-subnet-1a-association" {
//  subnet_id = aws_subnet.happy-dev-private-subnet-1a.id
//  route_table_id = aws_route_table.dev-rt-nat.id
//}
//
//resource "aws_route_table_association" "happy-dev-private-subnet-1b-association" {
//  subnet_id = aws_subnet.happy-dev-private-subnet-1b.id
//  route_table_id = aws_route_table.dev-rt-nat.id
//}