output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "flask_url" {
  value = "http://${aws_lb.app_alb.dns_name}/flask"
}

output "express_url" {
  value = "http://${aws_lb.app_alb.dns_name}/express"
}
