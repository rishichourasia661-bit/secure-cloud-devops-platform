resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "ca-central-1b"

  map_public_ip_on_launch = false

  tags = {
    Name        = "secure-devops-private-subnet"
    Project     = "secure-cloud-devops-platform"
    Environment = "staging"
  }
}