terraform {
  required_providers {
    ovirt = {
      source  = "oVirt/ovirt"
      version = "2.1.5"
    }
  }
}
provider "ovirt" {
  url          = var.ovirt_url
  username     = var.ovirt_username
  password     = var.ovirt_password
  tls_ca_files = var.ovirt_tls_ca
}
terraform {
  backend "local" {
    path = "ovirt_terraform.tfstate"
  }
}
