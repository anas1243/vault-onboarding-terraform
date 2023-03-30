resource "vault_auth_backend" "k8s_auth" {
  type = "kubernetes"
  path = var.engine_path
}

# in the config we will use the vault ca crt and token

resource "vault_kubernetes_auth_backend_config" "k8s_config" {
  backend                = vault_auth_backend.k8s_auth.path
  kubernetes_host        = var.k8s_host
  kubernetes_ca_cert     = var.ca_crt
  token_reviewer_jwt     = var.jwt_token
  issuer                 = "api"
  disable_iss_validation = "true"
} 

resource "vault_kubernetes_auth_backend_role" "devweb-app" {
  for_each                         = var.k8s_roles
  backend                          = vault_auth_backend.k8s_auth.path
  role_name                        = each.value["role_name"]
  bound_service_account_names      = each.value["bind_sa"]
  bound_service_account_namespaces = each.value["k8s_ns"]
  token_ttl                        = 3600
  token_policies                   = each.value["policies"]
}