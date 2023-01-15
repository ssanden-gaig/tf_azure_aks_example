
variable "location" {
  type        = string
  description = "The primary location for our resources"
  default     = "eastus2"
}

# variable "rg_name" {
#     type = string
#     default = "rg-${random_uuid}"
# }

variable "storage_acct_name" {
  type        = string
  description = "The storage account for our stuff"

}

variable "container_name" {
  type        = string
  description = "The container name"
  default     = "mydocs"
}
