# Namespaces variables
variable "project_namespace" {
  type = list(any)
}

variable "envs_namespaces" {
  type = list(any)
}

variable "working_namespaces" {
  type = list(any)
}

#LDAP variables
variable "customer_ldap" {
  type = list(any)
}

# policies variables
variable "secret_owner_policies" {
  type = list(any)
}
variable "secret_consumer_policies" {
  type = list(any)
}



# Groups/group
variable "owner_group_name" {
  type    = string
  default = ""
}

variable "consumer_group_name" {
  type    = string
  default = ""
}

variable "group_type" {
  type    = string
  default = ""
}

# Groups/aliases
variable "owner_alias_name" {
  type    = string
  default = ""
}
variable "consumer_alias_name" {
  type    = string
  default = ""
}

# Secret Engine
variable "secret_path" {
  type = string
}
variable "secret_type" {
  type = string
}

# k8s Auth Method
variable "auth_info" {
  type = map(object({
    k8s_ns      = optional(string) 
    engine_path = string
    k8s_host    = string
    ca_crt      = string
    jwt_token   = string
    k8s_roles = map(object({
      role_name = string
      policies  = list(string)
      k8s_ns    = list(string)
      bind_sa   = list(string)
    }))
  }))
}
