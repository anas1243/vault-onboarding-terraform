# Namespaces variables
variable "service" {
  type = string
}
variable "market" {
  type = string
}
variable "area" {
  type = string
}
variable "project" {
  type = string
}
variable "has_prod_env" {
  type = bool
}

variable "has_non_prod_env" {
  type = bool
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


