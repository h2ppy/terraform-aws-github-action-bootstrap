resource "aws_internet_gateway" "happy-dev-internet-gateway" {
  vpc_id = aws_vpc.happy-dev-vpc.id
  tags = {
    Name = "happy-dev-internet-gateway"
  }
}