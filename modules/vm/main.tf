data "ovirt_cluster_hosts" "list" {
  cluster_id = var.cluster_id
}
resource "ovirt_vm" "vm" {
  name                         = var.vm_name
  initialization_hostname      = var.vm_hostname
  comment                      = var.vm_comment
  clone                        = var.clone_vm
  cluster_id                   = var.cluster_id
  template_id                  = var.template_id
  os_type                      = var.vm_os_type
  cpu_cores                    = var.vm_cpu_cores
  cpu_sockets                  = var.vm_cpu_sockets
  cpu_threads                  = var.vm_cpu_threads
  memory                       = local.vm_memory_bytes
  maximum_memory               = local.vm_max_memory_bytes
  initialization_custom_script = var.vm_custom_script
  placement_policy_affinity    = var.vm_placement_policy_affinity
  placement_policy_host_ids    = data.ovirt_cluster_hosts.list.hosts[*].id
  lifecycle {
    ignore_changes = [os_type]
  }
}
resource "ovirt_vm_start" "vm_start" {
  vm_id         = ovirt_vm.vm.id
  stop_behavior = "stop"
  force_stop    = "true"
}
data "ovirt_wait_for_ip" "vm_wait_for_ip" {
  vm_id = ovirt_vm_start.vm_start.id
}
