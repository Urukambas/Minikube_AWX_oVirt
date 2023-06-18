resource "ovirt_tag" "create_tag" {
  name = "minikube"
}
module "minikube" {
  source      = "./modules/vm"
  vm_name     = "VM NAME"
  vm_hostname = "VM HOSTNAME IF REQUIRED"
  cluster_id  = "CLUSTER ID"
  template_id = "TEMPLATE ID"
}
resource "ovirt_vm_tag" "attach_tag" {
  tag_id = ovirt_tag.create_tag.id
  vm_id  = module.minikube.vm_id
}
