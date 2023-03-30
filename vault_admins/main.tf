module "admin_ldap_auth_method" {
  source          = "../modules/ldap_auth_method"
  ldap_namespaces = var.working_namespaces
  ldap_map        = var.admin_ldap[0]
}

module "admins_policies" {
  source            = "../modules/policies"
  policies          = var.policies
  policy_namespaces = var.working_namespaces
}

module "admins_identity_groups" {
  source           = "../modules/groups"
  group_name       = var.group_name
  group_type       = var.group_type
  group_policies   = module.admins_policies.policies_name
  group_namespaces = var.working_namespaces
}

module "admins_identity_alias" {
  source           = "../modules/aliases"
  alias_name       = var.alias_name
  mount_accessor   = module.admin_ldap_auth_method.ldaps_accessor
  group_id         = module.admins_identity_groups.groups_id
  alias_namespaces = var.working_namespaces

}