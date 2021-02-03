resource "aws_security_group" "chem101-dev-eb-elb-security-group" {
  name        = "chem101-dev-eb-elb-security-group"
  description = "chem101-dev-eb-elb-security-group"
  vpc_id      = aws_vpc.happy-dev-vpc.id
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "chem101-dev-eb-elb-security-group"
  }
}

resource "aws_security_group" "chem101-dev-eb-instance-security-group" {
  name        = "chem101-dev-eb-instance-security-group"
  description = "chem101-dev-eb-instance-security-group"
  vpc_id      = aws_vpc.happy-dev-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.chem101-dev-eb-elb-security-group.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.chem101-dev-bastion-security-group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "chem101-dev-eb-instance-security-group"
  }
}

resource "aws_security_group" "chem101-dev-bastion-security-group" {
  name        = "chem101-dev-bastion-security-group"
  description = "chem101-dev-bastion-security-group"
  vpc_id      = aws_vpc.happy-dev-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.68.52.233/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.67.52.233/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "chem101-dev-bastion-security-group"
  }
}

resource "aws_security_group" "chem101-dev-elasticache-security-group" {
  name        = "chem101-dev-elasticache-security-group"
  description = "chem101-dev-elasticache-security-group"
  vpc_id      = aws_vpc.happy-dev-vpc.id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.chem101-dev-bastion-security-group.id, aws_security_group.chem101-dev-eb-instance-security-group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform   = "true"
    Name = "chem101-dev-elasticache-security-group"
  }
}
