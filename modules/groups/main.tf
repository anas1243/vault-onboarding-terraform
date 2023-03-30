resource "vault_identity_group" "admins_identity_group" {
  for_each = toset(var.group_namespaces)
  name     = var.group_name
  type     = var.group_type
  policies = var.group_policies
  namespace = each.value
}