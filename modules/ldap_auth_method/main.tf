resource "vault_ldap_auth_backend" "customer_admins_ldap" {
    depends_on = [var.area_namespace]
    namespace = var.area_namespace
    path        = var.ldap_path
    url         = var.ldap_url
    userdn      = var.ldap_userdn
    userattr    = var.ldap_userattr
    binddn      = var.ldap_binddn
    bindpass = var.ldap_bindpass
    userfilter = var.ldap_userfilter

    groupdn     = var.ldap_groupdn
    groupfilter = var.ldap_groupfilter
    groupattr = var.ldap_groupattr
}