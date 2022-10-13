provider "azurerm" {
  version     = "2.85.0"
  subscription_id = "457b89a8-82bc-4337-a34c-dff14982f42d"
  client_id       = "688007ee-10a5-457b-9d21-0bce214943b3"
  client_secret   = "DId8Q~1cFcUnWM.CA0NMcRAYGDF_nRSn7.ZvdbWP"
  tenant_id       = "be387676-1096-4531-91c8-a16c66db0b57"
  features {}
}

resource "azurerm_resource_group" "tf_test" {
  name          = "tfmainrg"
  location      = "Australia East"
}

resource "azurerm_container_group" "tfcg_test" {
  name          = "weatherapi"
  location      = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name 

  ip_address_type = "public"
  dns_name_label = "asethori"
  os_type = "Linux"
  
  container {
    name = "weatherapi"
    image = "asethori/weatherapi"
    cpu = "1"
    memory = "1"

    ports {
      port = "80"
      protocol = "TCP"
    }
  }
}