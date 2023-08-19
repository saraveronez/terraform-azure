variable "rg-name" {
  type        = string
  description = "Resource Group name"
  default     = "rg-tf-azure"
}

variable "location" {
  type        = string
  description = "Location of resources in Azure"
  default     = "brazilsouth"
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
    101 = 80
    102 = 443
    103 = 3389 #acesso a rdp
    104 = 22
  }
}
