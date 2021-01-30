resource "aws_eip" "happy-ip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.happy-dev-internet-gateway]
  tags = {
    Name = "happy-ip"
  }
}