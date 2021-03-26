data "azurerm_resource_group" "rg_webhookpush" {
  name     = "${var.resource_group_webhookpush}-${var.environment}"
  location = var.location[var.environment]

#  tags = local.tags
#  lifecycle {
#    ignore_changes = [
#      tags,
#    ]
#   prevent_destroy = true
#  }
}
