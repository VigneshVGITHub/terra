# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "Vignesh-tf"

#     workspaces {
#       name = "ValidateMee"
#     }

#   }
# } 

#  credentials "app.terraform.io" {
#   token = "4vQ1k2ay3RZEOw.atlasv1.lMRkf7GfAg0syJpayozXlYscXHXXKy8tLRHLc2zuLPhbrgkifovBu9mG8U957CYzX0U"
# }

provider "azurerm" {
  features {}
  subscription_id     = "189d9bc0-4968-4a6f-80f7-323eb416d0a9"
  client_id           = "68871c6a-2529-49b4-b654-ce87912b0d30"
  client_secret       = "U_a/PYx35W.3FdQ6DnQU[/BTu2J8219C"
  tenant_id           = "ef02dce0-af67-446c-abf8-4852b1404723"
}

locals {
  module_version      = "1.0.0"
  module_short_name   = "rg"
  module_name         = "Resource group Module"
  module_tags = {
        module  = "${local.module_short_name}_${local.module_version}"
    }
  tags = merge(var.tags, local.module_tags)

  # Used for location ID mapping
  location_shortname = {
    "westeurope" = "1eu"
    "northeurope" = "2eu"
    "westus" = "1us"
    "eastus" = "2us"
  }

  region_to_stages = setproduct(var.regions, var.stage)
}

resource "azurerm_resource_group" "rg" {
    count       = length(local.region_to_stages)
    name        = "${substr(local.region_to_stages[count.index][1], 0, 1)}az${local.location_shortname[local.region_to_stages[count.index][0]]}-${var.subscription_short_name}${var.service_short_name}-rg${format("%02.0f", var.instance_number)}"
    location    = local.region_to_stages[count.index][0]

    tags = local.tags
}
