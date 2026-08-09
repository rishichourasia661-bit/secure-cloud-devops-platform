output "app_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "app_public_ip" {
  description = "Public IP address of the application server"
  value       = aws_instance.app.public_ip
}

output "app_public_dns" {
  description = "Public DNS name of the application server"
  value       = aws_instance.app.public_dns
}
output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}