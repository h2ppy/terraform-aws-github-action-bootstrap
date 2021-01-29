provider "aws" {
  region = "us-east-1"
}

module "keypair" {
  source      = "git::https://github.com/rhythmictech/terraform-aws-secretsmanager-keypair"
  name_prefix = "chem101-dev"
  description = "SSH keypair for instances"
}

output "instance_ip_addr" {
  value = file("${path.module}/user1.pem")
}