output "arn" {
  value = aws_instance.ec2.arn
}

output "instance_id" {
  value = aws_instance.ec2.id
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "instance_state" {
  value = aws_instance.ec2.instance_state
}

output "key_name" {
  value = var.key_name
}
