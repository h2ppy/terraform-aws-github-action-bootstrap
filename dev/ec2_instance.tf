module "bastion-host" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "bastion-host-dev"
  instance_count         = 1
  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "chem101-dev2"
  associate_public_ip_address = true
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.chem101-dev-bastion-security-group.id]
  subnet_id              = aws_subnet.happy-dev-public-subnet-1a.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}