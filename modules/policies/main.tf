locals {
  local_policies = var.policies
  local_namespaces = var.policy_namespaces
  # local_policies_merge = [
  #   for index, policies in local.local_policies:
  #     merge(policies, {policy_namespace = local.local_namespaces[index]})
  # ]

  local_policies_merge = {for policy in setproduct(local.local_policies, local.local_namespaces):
                "${policy[0].policy_name}-${policy[1]}" => policy} 
}
resource "vault_policy" "policy" {
  for_each = {for policy in local.local_policies_merge:  "${policy[0].policy_name}-${policy[1]}" => policy}
  namespace = each.value[1]
  name = each.value[0].policy_name
  policy = each.value[0].policy_body
}

