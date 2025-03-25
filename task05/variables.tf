## variables.tf
variable "resource_groups" {
  description = "List of resource groups with their names and locations"
  type = list(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "List of app service plans with their names, locations, SKU, and worker count"
  type = list(object({
    name         = string
    location     = string
    sku          = string
    worker_count = number
  }))
}

variable "app_services" {
  description = "List of app services with their names and service plan associations"
  type = list(object({
    name            = string
    location        = string
    service_plan_id = string
    ip_restrictions = list(map(string))
  }))
}

variable "traffic_manager" {
  description = "Traffic manager profile configuration"
  type = object({
    name           = string
    routing_method = string
  })
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

