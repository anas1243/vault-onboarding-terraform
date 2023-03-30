
output "groups_id" {
  value = {for index, group in vault_identity_group.admins_identity_group : group.namespace => group.id}
  # value = [for group in vault_identity_group.admins_identity_group: group.id]
  # value = vault_identity_group.admins_identity_group.id
}