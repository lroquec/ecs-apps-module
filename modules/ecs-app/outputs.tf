output "app_url" {
  description = "URL where the application is accessible"
  value       = "http://${var.service_name}.lroquec.com"
}

output "dns_name" {
  description = "DNS name of the service"
  value       = "${var.service_name}.lroquec.com"
}