locals {
  tags = {
    cadeia-valor          = var.cadeia-valor
    estagio               = var.environment
    conjunto-orcamentario = var.conjunto-orcamentario
    sn-produto            = lower(var.prefix_name_webhookpush)
    sn-modulo             = lower(var.prefix_name_webhookpush)
  }
}