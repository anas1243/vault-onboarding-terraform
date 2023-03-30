resource "vault_identity_group_alias" "group-alias" {
  for_each = toset(var.alias_namespaces)
  name           = var.alias_name
  mount_accessor = var.mount_accessor[each.value]
  canonical_id   = var.group_id[each.value]
  namespace = each.value
}