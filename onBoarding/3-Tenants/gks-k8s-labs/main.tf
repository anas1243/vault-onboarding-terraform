provider "vault" {

}

module "project_namespace" {
  source           = "../../../modules/namespaces"
  namespaces = var.project_namespace
}

module "envs_namespaces" {
  depends_on = [
    module.project_namespace.namespaces_path
  ]
  source           = "../../../modules/namespaces"
  namespaces = var.envs_namespaces
}


module "ldap_auth_method" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source           = "../../../modules/ldap_auth_method"
  # ldap_namespaces   = module.envs_namespaces.namespaces_path
  ldap_namespaces   = var.working_namespaces
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


module "admins_policies" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
    source = "../../../modules/policies"
    policies = var.policies
    # policy_namespaces = module.envs_namespaces.namespaces_path
    policy_namespaces = var.working_namespaces
}

module "admins_identity_groups" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
    source = "../../../modules/groups"
    group_name = var.group_name
    group_type = var.group_type
    group_policies = module.admins_policies.policies_name
    group_namespaces = var.working_namespaces
}

module "admins_identity_alias" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
    source = "../../../modules/aliases"
    alias_name = var.alias_name
    mount_accessor = module.ldap_auth_method.ldaps_accessor
    group_id = module.admins_identity_groups.groups_id
    alias_namespaces = var.working_namespaces
}