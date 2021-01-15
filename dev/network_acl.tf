resource "aws_default_network_acl" "private-acl" {
  default_network_acl_id = aws_vpc.happy-dev-vpc.default_network_acl_id
  subnet_ids = [
    aws_subnet.happy-dev-private-subnet-1a.id,
    aws_subnet.happy-dev-private-subnet-1b.id]
  egress {
    protocol = "all"
    rule_no = 100
    cidr_block = "0.0.0.0/0"
    action = "allow"
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = "all"
    rule_no = 100
    cidr_block = "0.0.0.0/0"
    action = "allow"
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "private-acl"
  }

  lifecycle {
    ignore_changes = [
      subnet_ids]
  }
}

resource "aws_network_acl" "public-acl" {
  vpc_id = aws_vpc.happy-dev-vpc.id
  subnet_ids = [
    aws_subnet.happy-dev-public-subnet-1a.id,
    aws_subnet.happy-dev-public-subnet-1b.id]
  egress {
    protocol = "all"
    rule_no = 100
    cidr_block = "0.0.0.0/0"
    action = "allow"
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = "all"
    rule_no = 100
    cidr_block = "0.0.0.0/0"
    action = "allow"
    from_port = 0
    to_port = 0
  }
  tags = {
    Name = "public-acl"
  }

}