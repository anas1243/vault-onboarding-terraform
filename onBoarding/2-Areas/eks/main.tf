provider "vault" {

}

module "namespaces" {
    source = "../../../modules/namespaces"
    namespaces = var.namespaces
}