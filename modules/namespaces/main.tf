resource "vault_namespace" "service" {
  path = var.service
}

resource "vault_namespace" "market" {
  namespace = vault_namespace.service.path_fq
  path = var.market
}

resource "vault_namespace" "area" {
  namespace = vault_namespace.market.path_fq
  path = var.area
}

resource "vault_namespace" "project" {
  namespace = vault_namespace.area.path_fq
  path = var.project
}

resource "vault_namespace" "prod_env" {
  namespace = vault_namespace.project.path_fq
  path = "prod"
  count = var.has_prod_env ? 1 : 0
}

resource "vault_namespace" "non_prod_env" {
  namespace = vault_namespace.project.path_fq
  path = "non-prod"
  count = var.has_non_prod_env ? 1 : 0 
}