variable "rg_name" {
  type        = string
  description = "Resource Group name"
  default     = "rg_tf_azure"
}

variable "location" {
  type        = string
  description = "Location of resources in Azure"
  default     = "brazilsouth"
}

variable "environment" {
  type        = string
  description = "Environment"
  default   = "prod"
}

variable "vnet_address_space" {
  type    = list(any)
  default = ["10.0.0.0/16", "192.168.0.0/16"]
}

locals {
  tags = {
    environment = "Development"
    owner       = "Sara"
    date        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}

variable "ports" {
  type        = map(any)
  description = "Inbound Ports available by nsg"
  default = {
    101 = 80 #http
    102 = 443 #ssl
    103 = 3389 #rdp
    104 = 22 #ssh
  }
}
