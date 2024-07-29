variable "name" {
  description = "(Required) Name of the acr"
  type        = string
}

variable "resource_group" {
  description = "(Required) The name of the acr's resource group"
  type        = string
}

variable "location" {
  description = "(Required) The location associated with the acr"
  type        = string
}

variable "subnet_id" {
  description = "(Required) the subnet where the acr will be created."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "(Required) ID of the log analytics workspace to which the diagnostic setting will send the logs of this resource."
  type        = string
  default     = null
}

variable "sku" {
  description = "(Optional) The sku of the acr"
  default     = "Standard"
  type        = string
  validation {
    condition     = can(regex("^(Basic|Standard|Premium)$", var.sku))
    error_message = "Invalid sku selected, only allowed values are: 'Basic', 'Standard', 'Premium'. Default 'Standard'"
  }
}

variable "admin_enabled" {
  description = "(Optional) Specifies whether the admin user is enabled"
  default     = true
  type        = bool
  validation {
    condition     = contains([true, false], var.admin_enabled)
    error_message = "Invalid value, only allowed values are: 'true' or 'false'. Default 'true'"
  }
}

variable "zone_redundancy_enabled" {
  description = "(Optional) Specifies whether zone redundancy is enabled for this Container Registry"
  default     = true
  type        = bool
  validation {
    condition     = can(regex("^(true|false)$", var.zone_redundancy_enabled))
    error_message = "Invalid value, only allowed values are: 'true' or 'false'. Default 'true'"
  }
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the acr resource."
  type        = map(string)
  default     = {}
}

variable "public_network_access_enabled" {
  description = "(Optional) defines whether public network access is allowed for the container registry"
  type        = bool
  default     = true
  validation {
    condition     = can(regex("^(true|false)$", var.public_network_access_enabled))
    error_message = "Invalid value, only allowed values are: 'true' or 'false'. Default 'true'"
  }
}

variable "export_policy_enabled" {
  description = "(Optional) indicates whether export policy is enabled"
  type        = bool
  default     = true
  validation {
    condition     = can(regex("^(true|false)$", var.export_policy_enabled))
    error_message = "Invalid value, only allowed values are: 'true' or 'false'. Default 'true'"
  }
}

variable "private_endpoint_manual_connection" {
  description = "(Optional) Determines whether the private endpoint requires manual approval from the remote resource owner."
  default     = true
  type        = bool
}

variable "private_endpoint_subresource" {
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to"
  default     = ["registry"]
  type        = set(string)
}
