output "namespaces_path" {
  value = toset([for namespace in vault_namespace.namespaces : namespace.path_fq])
}
