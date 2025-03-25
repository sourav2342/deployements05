app_service_plans = [
  {
    name         = "cmaz-64aed6d7-mod5-asp-01"
    location     = "East US"
    sku          = "P0v3"
    worker_count = 2
  },
  {
    name         = "cmaz-64aed6d7-mod5-asp-02"
    location     = "West US"
    sku          = "P1v3"
    worker_count = 1
  }
]


app_services = [
  {
    name             = "cmaz-64aed6d7-mod5-app-01"
    location         = "East US"
    app_service_plan = "cmaz-64aed6d7-mod5-asp-01"
  },
  {
    name             = "cmaz-64aed6d7-mod5-app-02"
    location         = "West US"
    app_service_plan = "cmaz-64aed6d7-mod5-asp-02"
  }
]


resource_groups = [
  {
    name     = "cmaz-64aed6d7-mod5-rg-01"
    location = "East US"
  },
  {
    name     = "cmaz-64aed6d7-mod5-rg-02"
    location = "West US"
  },
  {
    name     = "cmaz-64aed6d7-mod5-rg-03"
    location = "Central US"
  }
]


traffic_manager = {
  name           = "cmaz-64aed6d7-mod5-traf"
  routing_method = "Performance"
}


tags = {
  Creator = "raavi_sourav@epam.com"
}
