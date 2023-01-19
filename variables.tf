variable "location" {
  type        = string
  description = "The primary location for our resources"
  default     = "eastus2"
}

variable "storage_account_name" {
  type        = string
  description = "The azure storage account name"
}

variable "container_name" {
  type        = string
  description = "The container name"
}
variable "resource_group_name" {
  type = string
  default = "az-rg"
  nullable=false
}