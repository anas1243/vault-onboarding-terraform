output "envs_paths" {
  # value = [for namespace in module.envs_namespaces : namespace.namespaces_path]
  value = module.envs_namespaces.namespaces_path
}

output "project_path" {
  value = module.project_namespace.namespaces_path
}