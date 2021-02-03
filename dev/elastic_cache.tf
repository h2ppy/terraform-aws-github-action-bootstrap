resource "aws_elasticache_cluster" "chem101-dev-redis" {
  cluster_id = "chem101-dev-redis"
  engine = "Redis"
  node_type = "cache.t2.small"
  num_cache_nodes = 1
  parameter_group_name = "default.redis5.0"
  engine_version = "5.0.5"
  port = 6379
  subnet_group_name = aws_elasticache_subnet_group.chem101-dev-private-subnet-group.name
  security_group_ids = [
    aws_security_group.chem101-dev-elasticache-security-group.id]
  maintenance_window = "sat:07:30-sat:08:30"
  tags = {
    Terraform   = "true"
    Name = "chem101-dev-redis"
  }
}