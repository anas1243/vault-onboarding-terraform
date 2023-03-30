variable "engine_path" {}

variable "k8s_host" {
  type = string
  description = "the k8s host address used in the k8s auth config"
}
variable "ca_crt" {
  type = string
  description = "the ca certificate of the vault SA in the k8s cluster, used in the k8s auth config"
}

variable "jwt_token" {
  type = string
  description = "the jwt token reivewr of the SA used in the k8s auth config"
}


variable "k8s_roles" {
  description = "the object map of all things need by role"
  type = map(object({
    role_name = string 
    policies = list(string)
    k8s_ns = list(string)
    bind_sa = list(string)

  }))
}
