output "app_name" {
  value       = azurerm_app_service.app.name
  description = "value"
}

output "default_hostname" {
  value       = azurerm_app_service.app.default_site_hostname
  description = "the default hostname of app"
}
