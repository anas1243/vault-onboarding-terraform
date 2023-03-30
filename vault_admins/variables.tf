variable "working_namespaces" {
  type    = list(any)
  default = ["root"]
}
# LDAP variables
variable "admin_ldap" {
  type = list(any)
}

# Identity/groups
variable "group_name" {
  type = string
}
variable "group_type" {
  type = string
}

# Groups/aliases
variable "alias_name" {
  type = string
}

# Policies

variable "policies" {
  type = list(any)
}
