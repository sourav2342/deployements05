variable "name" {
  type        = string
  description = "value"
}

variable "resource_group_name" {
  type        = string
  description = "value"
}

variable "routing_method" {
  type        = string
  description = "value"
}

variable "endpoints" {
  type = list(object({
    name     = string
    target   = string
    priority = number
  }))
}
