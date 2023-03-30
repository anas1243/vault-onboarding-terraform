# Namespaces variables
variable "project_namespace" {
  type = list
}

variable "envs_namespaces" {
  type = list
}
variable "customer_ldap" {
  type = list
}
# Prod LDAP variables
# variable "ldap_path" {
#   type = string
#   default = ""
# }
# variable "ldap_url" {
#   type = string
#   default = ""
# }
# variable "ldap_userattr" {
#   type = string
#   default = ""
# }
# variable "ldap_binddn" {
#   type = string
#   default = ""
# }
# variable "ldap_bindpass" {
#   type = string
#   default = ""
# }
# variable "ldap_userdn" {
#   type = string
#   default = ""
# }
# variable "ldap_userfilter" {
#   type = string
#   default = ""
# }
# variable "ldap_groupattr" {
#   type = string
#   default = ""
# }
# variable "ldap_groupdn" {
#   type = string
#   default = ""
# }
# variable "ldap_groupfilter" {
#   type = string
#   default = ""
# }

variable "secret_owner_policies" {
  type = list
}
variable "secret_consumer_policies" {
  type = list
}


variable "working_namespaces" {
  type = list
}

# Groups/group
variable "owner_group_name" {
  type = string
  default = ""
}

variable "consumer_group_name" {
  type = string
  default = ""
}

variable "group_type" {
  type = string
  default = ""
}

# Groups/aliases
variable "owner_alias_name" {
  type = string
  default = ""
}
variable "consumer_alias_name" {
  type = string
  default = ""
}
