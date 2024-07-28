data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnet" {
  name = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_container_registry" "acr" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku  
  admin_enabled            = var.admin_enabled
  tags                     = var.tags
  # subnet_id = data.azurerm_subnet.subnetid.id

    identity {
    type = "SystemAssigned"
  }
  dynamic "georeplications" {
    for_each = var.georeplication_locations

    content {
      location = georeplications.value
      tags     = var.tags
    }
  }

  lifecycle {
      ignore_changes = [
          tags
      ]
  }
}

resource "azurerm_user_assigned_identity" "acr_identity" {
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  name = "${var.name}Identity"

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

# Create a private endpoint
resource "azurerm_private_endpoint" "pe" {
  name                = "acr-private-endpoint"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id          = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "my-psc"
    private_connection_resource_id = azurerm_container_registry.acr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }
}

# Associate private DNS zone 
resource "azurerm_private_dns_zone" "pdns" {
  name                = "privatelink.azurecr.io"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns-link" {
  name = "test1-dns-link"
  resource_group_name = data.azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.pdns.name
  virtual_network_id = data.azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_a_record" "event-arecord" {
  name                = "event-arecord-test"
  zone_name           = azurerm_private_dns_zone.pdns.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = 300
  records             = ["10.0.0.100"]
}
