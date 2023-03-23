provider "vault" {

}

module "namespaces" {
  source           = "../../modules/namespaces"
  service          = var.service
  market           = var.market
  area             = var.area
  project          = var.project
  has_prod_env     = var.has_prod_env
  has_non_prod_env = var.has_non_prod_env
}

module "ldap_auth_method" {
  source           = "../../modules/ldap_auth_method"
  area_namespace   = module.namespaces.area_path
  ldap_path        = var.ldap_path
  ldap_url         = var.ldap_url
  ldap_userdn      = var.ldap_userdn
  ldap_userattr    = var.ldap_userattr
  ldap_binddn      = var.ldap_binddn
  ldap_bindpass    = var.ldap_bindpass
  ldap_userfilter  = var.ldap_userfilter
  ldap_groupdn     = var.ldap_groupdn
  ldap_groupfilter = var.ldap_groupfilter
  ldap_groupattr   = var.ldap_groupattr
}
