output "flask_app_url" {
  description = "URL where the Flask application is accessible"
  value       = module.flask_app.app_url
}

output "nginx_app_url" {
  description = "URL where the Nginx application is accessible"
  value       = module.nginx_app.app_url
}
