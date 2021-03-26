data "azurerm_resource_group" "system-team" {
  name     = "${var.resource_group_webhookpush}"
  # location = var.location
#  tags = local.tags
#  lifecycle {
#    ignore_changes = [
#      tags,
#    ]
#   prevent_destroy = true
#  }
}
