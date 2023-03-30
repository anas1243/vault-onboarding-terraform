output "policies_name" {
  value = [for policy in vault_policy.policy : policy.name]
}