# resource "vault_namespace" "namespaces" {
#   for_each = var.namespaces
#   namespace = each.key
#   path = each.value
# }
resource "vault_namespace" "namespaces" {
  for_each = {for namespace in var.namespaces:  namespace.current_namespace => namespace}
  namespace = each.value.parent_namespace
  path = each.value.current_namespace
}

