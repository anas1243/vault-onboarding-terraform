provider "vault" {
  
}

module "namespaces" {
  source = "./modules/namespaces"
  service = var.service
  market = var.market
  area = var.area
  project = var.project
  has_prod_env = var.has_prod_env
  has_non_prod_env = var.has_non_prod_env
}