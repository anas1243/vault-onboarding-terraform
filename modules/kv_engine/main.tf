resource "vault_mount" "kvv2" {
  for_each = toset(var.secret_namespace)
  namespace = each.value
  path        = var.secret_path
  type        = var.secret_type
}
