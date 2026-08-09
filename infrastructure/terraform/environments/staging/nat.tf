resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "secure-devops-nat-eip"
    Project     = "secure-cloud-devops-platform"
    Environment = "staging"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  depends_on = [
    aws_internet_gateway.main
  ]

  tags = {
    Name        = "secure-devops-nat-gateway"
    Project     = "secure-cloud-devops-platform"
    Environment = "staging"
  }
}