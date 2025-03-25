output "traffic_manager_dns_name" {
  value = azurerm_traffic_manager_profile.tm.fqdn
}
