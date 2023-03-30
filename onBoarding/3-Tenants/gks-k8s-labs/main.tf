provider "vault" {

}

module "project_namespace" {
  source     = "../../../modules/namespaces"
  namespaces = var.project_namespace
}

module "envs_namespaces" {
  depends_on = [
    module.project_namespace.namespaces_path
  ]
  source     = "../../../modules/namespaces"
  namespaces = var.envs_namespaces
}


module "owner_ldap_auth_method" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source          = "../../../modules/ldap_auth_method"
  ldap_namespaces = var.working_namespaces
  ldap_map        = var.customer_ldap[0]
}

module "consumer_ldap_auth_method" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source          = "../../../modules/ldap_auth_method"
  ldap_namespaces = var.working_namespaces
  ldap_map        = var.customer_ldap[1]
}


module "secret_owner_policies" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source            = "../../../modules/policies"
  policies          = var.secret_owner_policies
  policy_namespaces = var.working_namespaces
}

module "secret_consumer_policies" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source            = "../../../modules/policies"
  policies          = var.secret_consumer_policies
  policy_namespaces = var.working_namespaces
}

module "owner_identity_groups" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source           = "../../../modules/groups"
  group_name       = var.owner_group_name
  group_type       = var.group_type
  group_policies   = module.secret_owner_policies.policies_name
  group_namespaces = var.working_namespaces
}

module "consumer_identity_groups" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source           = "../../../modules/groups"
  group_name       = var.consumer_group_name
  group_type       = var.group_type
  group_policies   = module.secret_consumer_policies.policies_name
  group_namespaces = var.working_namespaces
}

module "owner_identity_alias" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source           = "../../../modules/aliases"
  alias_name       = var.owner_alias_name
  mount_accessor   = module.owner_ldap_auth_method.ldaps_accessor
  group_id         = module.owner_identity_groups.groups_id
  alias_namespaces = var.working_namespaces
}

module "consumer_identity_alias" {
  depends_on = [
    module.envs_namespaces.namespaces_path
  ]
  source           = "../../../modules/aliases"
  alias_name       = var.consumer_alias_name
  mount_accessor   = module.consumer_ldap_auth_method.ldaps_accessor
  group_id         = module.consumer_identity_groups.groups_id
  alias_namespaces = var.working_namespaces
}