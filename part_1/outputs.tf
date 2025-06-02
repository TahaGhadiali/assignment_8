output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "flask_url" {
  value = "http://${aws_instance.web_server.public_ip}:${var.flask_port}/"
}

output "express_url" {
  value = "http://${aws_instance.web_server.public_ip}:${var.express_port}/"
}
