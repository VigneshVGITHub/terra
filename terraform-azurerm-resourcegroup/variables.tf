variable "regions" {
    type = list
    description = "region list"
    default = ["northeurope","westeurope"]
}

variable "stage" {
    type = list(string)
    default = ["production"]
}

variable "subscription_short_name" {
    type = string
}

variable "service_short_name" {
  type      = string
  default   = "net"
}

variable "instance_number" {
    type        = string
    description = "The instance number of this module within the current service"
}

variable "tags" {
    type        = map(string)
    description = "The collection of tags to be applied against all resources created by the module"
    default     = {}
}
