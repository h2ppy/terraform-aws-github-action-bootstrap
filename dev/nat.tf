//resource "aws_nat_gateway" "happy-dev-nat" {
//  allocation_id = aws_eip.happy-ip.id
//  subnet_id = aws_subnet.happy-dev-public-subnet-1a.id
//  tags = {
//    Name = "happy-dev-nats"
//  }
//}