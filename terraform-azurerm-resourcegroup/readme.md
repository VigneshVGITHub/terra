![Hero](media/project-hero.png)
[![Terraform](https://img.shields.io/badge/terraform-v0.12+-blue.svg)](https://www.terraform.io/downloads.html)
[![Known Issues](https://img.shields.io/badge/issues-0-green.svg)](#pending-features-known-issues)

## Basic Overview

This module creates resource groups based on the specified regions and stages.

<br>

## Dependencies

- terraform-azurerm-teamsubscription

<br>

## Variables

Variable | Description | Type
--- | --- | ---
`instance_number` | The instance number of this module within the current service. Instance numbers are unique within a service. | `number`
`service_short_name` (optional) | The service short name for the new resource groups (default: net) | `object`
`tags` (optional) | The collection of tags to be applied against all resources created by the module | `map(string)`
`subscription_short_name` | The code of the subscription (e.g. s120) | `string`
`stage` (optional) | Defines the stages where resource groups should be added (default: ["production"]) | `list(string`
`regions` | Defines the regions where resource groups should be added (default: ["westeurope", "northeurope", "eastus", "westus"] | `list(string)`

<br>

## Outputs
>**Heads up!** See the *usage* section below for more information on type and structure of these outputs

Output | Description
--- | ---
`rgs` | The set of route tables created by the module in each region and stage.

<br>

## Usage

The following example demonstrates how to use this module to launch *something or other*:
```javascript
module "rg" {
    source = "Source"
    stage = ["p"]

    regions = var.regions
    subscription_short_name = var.subscription_short_name
    service_short_name = var.rg_short_name
    instance_number = var.instance_number
    tags = var.tags
}
```

<br>

## Pending Features / Known Issues
Issue / Pending Feature | Link to JIRA
--- | ---
There are no issues or pending features with the template, but you might have a few. Hey, noone's perfect! | 