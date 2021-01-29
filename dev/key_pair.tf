variable "name_prefix" {
  default = ""
}
resource "aws_key_pair" "chem101-dev" {
  key_name_prefix = "chem101-dev"
  public_key      = file("${path.module}/chem101-dev.pub")
}