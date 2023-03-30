resource "vault_ldap_auth_backend" "customer_admins_ldap" {
    for_each = toset(var.ldap_namespaces)
    namespace = each.value
    path        = var.ldap_map.ldap_path
    url         = var.ldap_map.ldap_url
    userdn      = var.ldap_map.ldap_userdn
    userattr    = var.ldap_map.ldap_userattr
    binddn      = var.ldap_map.ldap_binddn
    bindpass = var.ldap_map.ldap_bindpass
    userfilter = var.ldap_map.ldap_userfilter

    groupdn     = var.ldap_map.ldap_groupdn
    groupfilter = var.ldap_map.ldap_groupfilter
    groupattr = var.ldap_map.ldap_groupattr
}
