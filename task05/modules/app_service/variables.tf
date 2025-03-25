variable "name" {
  type        = string
  description = "value"
}

variable "location" {
  type        = string
  description = "value"
}

variable "resource_group_name" {
  type        = string
  description = "value"
}

variable "app_service_plan_id" {
  type        = string
  description = "value"
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    action      = string
    ip_address  = optional(string) # Allow ip_address to be optional
    service_tag = optional(string)
  }))
  default = []
}
