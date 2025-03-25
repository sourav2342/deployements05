resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.name
    ttl           = 30
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
}

resource "azurerm_traffic_manager_endpoint" "endpoints" {
  for_each = { for idx, endpoint in var.endpoints : idx => endpoint }

  name       = each.value.name
  profile_id = azurerm_traffic_manager_profile.tm.id
  target     = each.value.target
  priority   = each.value.priority
  type       = "AzureEndpoints"
}
