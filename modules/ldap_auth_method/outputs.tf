output "ldaps_accessor" {
  # value = vault_ldap_auth_backend.customer_admins_ldap.accessor
  value = {for ldap in vault_ldap_auth_backend.customer_admins_ldap : ldap.namespace =>  ldap.accessor}
  
}