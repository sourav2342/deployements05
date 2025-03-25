module "rg1" {
  source   = "./modules/resource_group"
  name     = "cmaz-64aed6d7-mod5-rg-01"
  location = "East US"
}

module "rg2" {
  source   = "./modules/resource_group"
  name     = "cmaz-64aed6d7-mod5-rg-02"
  location = "West US"
}

module "rg3" {
  source   = "./modules/resource_group"
  name     = "cmaz-64aed6d7-mod5-rg-03"
  location = "Central US"
}

module "app1" {
  source              = "./modules/app_service"
  name                = "cmaz-64aed6d7-mod5-app-01"
  resource_group_name = module.rg1.name
  location            = module.rg1.location
  app_service_plan_id = module.app_service_plan_1.id
  ip_restrictions = [
    { name = "allow-ip", action = "Allow", ip_address = "18.153.146.156/32", service_tag = null },
    { name = "allow-tm", action = "Allow", service_tag = "AzureTrafficManager", ip_address = null }
  ]
}

module "app2" {
  source              = "./modules/app_service"
  name                = "cmaz-64aed6d7-mod5-app-02"
  resource_group_name = module.rg2.name
  location            = module.rg2.location
  app_service_plan_id = module.app_service_plan_2.id
  ip_restrictions = [
    { name = "allow-ip", action = "Allow", ip_address = "18.153.146.156/32", service_tag = null },
    { name = "allow-tm", action = "Allow", service_tag = "AzureTrafficManager", ip_address = null }
  ]
}

module "app_service_plan_1" {
  source              = "./modules/app_service_plan"
  name                = "cmaz-64aed6d7-mod5-asp-01"
  location            = "East US"
  resource_group_name = "cmaz-64aed6d7-mod5-rg-01"
  sku_tier            = "PremiumV3"
  sku_size            = "P0v3"
}

module "app_service_plan_2" {
  source              = "./modules/app_service_plan"
  name                = "cmaz-64aed6d7-mod5-asp-02"
  location            = "West US"
  resource_group_name = "cmaz-64aed6d7-mod5-rg-02"
  sku_tier            = "PremiumV3"
  sku_size            = "P1v3"
}


module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = "cmaz-64aed6d7-mod5-traf"
  resource_group_name = module.rg3.name
  routing_method      = "Performance"
  endpoints = [
    { name = "app1", type = "azureEndpoints", target = module.app1.default_hostname, priority = 1 },
    { name = "app2", type = "azureEndpoints", target = module.app2.default_hostname, priority = 2 }
  ]
}

