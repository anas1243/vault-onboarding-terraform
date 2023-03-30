variable "working_namespaces" {
  type = list
  default = ["root"]
}
# LDAP variables
variable "ldap_path" {
  type = string
}
variable "ldap_url" {
  type = string
}

variable "ldap_userattr" {
  type = string
}
variable "ldap_binddn" {
  type = string
}
variable "ldap_bindpass" {
  type = string
}
variable "ldap_userdn" {
  type = string
}
variable "ldap_userfilter" {
  type = string
}

variable "ldap_groupattr" {
  type = string
}
variable "ldap_groupdn" {
  type = string
}
variable "ldap_groupfilter" {
  type = string
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
  type = list
}
