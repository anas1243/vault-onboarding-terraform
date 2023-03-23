output "market_path" {
  value = vault_namespace.market.path_fq
}
output "area_path" {
  value = vault_namespace.area.path_fq
}
output "project_path" {
  value = vault_namespace.project.path_fq
}
output "prod_path" {
  value = length(vault_namespace.prod_env) > 0 ? vault_namespace.prod_env[0].path_fq : null
  #value = vault_namespace.prod_env[var.has_prod_env ? 1 : 0].path_fq
}
output "non_prod_path" {
  value = length(vault_namespace.non_prod_env) > 0 ? vault_namespace.non_prod_env[0].path_fq : null
}