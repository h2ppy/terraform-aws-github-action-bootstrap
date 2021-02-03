resource "aws_elasticache_subnet_group" "chem101-dev-private-subnet-group" {
  name       = "chem101-dev-private-subnet-group"
  subnet_ids = [aws_subnet.happy-dev-private-subnet-1a.id, aws_subnet.happy-dev-private-subnet-1b.id]
}