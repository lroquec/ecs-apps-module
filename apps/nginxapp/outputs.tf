output "app_url" {
  description = "URL where the application is accessible"
  value       = "http://${module.flask_service.dns_name}"
}

output "dns_name" {
  description = "DNS name of the service"
  value       = module.flask_service.dns_name
}