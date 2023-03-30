resource "vault_policy" "secrets_owner" {
  name = "secrets_owner"

  policy = <<EOT
# Manage secrets
path "secrets/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

EOT
}

resource "vault_policy" "secrets_consumer" {
  name   = "secrets_consumer"
  count  = var.count
  policy = <<EOT
# Manage secrets
path "secrets/*"
{
  capabilities = ["read", "list"]
}
EOT
}
