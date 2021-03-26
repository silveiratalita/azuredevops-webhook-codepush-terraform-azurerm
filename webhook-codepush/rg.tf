# resource "azurerm_resource_group" "rg_webhookpush" {
#   name     = "${var.prefix_name_webhookpush}-${var.environment}"
#   location = var.location[var.environment]

#   tags = local.tags
#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#     prevent_destroy = true
#   }
# }
