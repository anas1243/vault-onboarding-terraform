# Namespaces variables
variable "project_namespace" {
  type = list
}

variable "envs_namespaces" {
  type = list
}

# Prod LDAP variables
variable "ldap_path" {
  type = string
  default = ""
}
variable "ldap_url" {
  type = string
  default = ""
}
variable "ldap_userattr" {
  type = string
  default = ""
}
variable "ldap_binddn" {
  type = string
  default = ""
}
variable "ldap_bindpass" {
  type = string
  default = ""
}
variable "ldap_userdn" {
  type = string
  default = ""
}
variable "ldap_userfilter" {
  type = string
  default = ""
}
variable "ldap_groupattr" {
  type = string
  default = ""
}
variable "ldap_groupdn" {
  type = string
  default = ""
}
variable "ldap_groupfilter" {
  type = string
  default = ""
}

variable "policies" {
  type = list
}


variable "working_namespaces" {
  type = list
}

# Groups/group
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
