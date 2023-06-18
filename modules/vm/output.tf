output "vm_id" {
  description = "ВМ ID"
  value       = ovirt_vm.vm.id
}
output "vm_start_id" {
  description = "ID запуска ВМ"
  value       = ovirt_vm_start.vm_start.id
}
output "ip_waiter_id" {
  description = "ID for IP waiter"
  value       = data.ovirt_wait_for_ip.vm_wait_for_ip.id
}
