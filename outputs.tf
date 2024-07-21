output "id" {
  value       = azurerm_container_registry.this.id
  description = "The id of the acr."
}

output "name" {
  value       = azurerm_container_registry.this.name
  description = "The name of the acr."
}

output "location" {
  value       = azurerm_container_registry.this.location
  description = "The location of the acr."
}

output "resource_group_name" {
  value       = azurerm_container_registry.this.resource_group_name
  description = "The name of the resource group of the acr."
}

output "private_endpoint_private_ip" {
  value       = module.hub_acr_private_endpoint.private_ip
  description = "The private ip of the private endpoint associated with acr."
}
