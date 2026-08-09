data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "app" {
  key_name   = "secure-devops-app-key"
  public_key = file("~/.ssh/secure-devops-key.pub")

  tags = {
    Name        = "secure-devops-app-key"
    Project     = "secure-cloud-devops-platform"
    Environment = "staging"
  }
}

resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  key_name = aws_key_pair.app.key_name

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2_ecr.name

  user_data = <<-EOF
#!/bin/bash

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

echo "<h1>Secure Cloud DevOps Platform</h1>" > /var/www/html/index.html
echo "<p>Application server deployed using Terraform.</p>" >> /var/www/html/index.html

EOF

  tags = {
    Name        = "secure-devops-app-server"
    Project     = "secure-cloud-devops-platform"
    Environment = "staging"
  }
}