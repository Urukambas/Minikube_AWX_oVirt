variable "vm_tag" {
  description = "Тег ВМ"
  default     = ""
}
variable "vm_name" {
  description = "Имя ВМ"
  default     = ""
}
variable "vm_hostname" {
  description = "Имя хоста ВМ"
  default     = ""
}
variable "vm_comment" {
  description = "Комментарий ВМ"
  default     = ""
}
variable "clone_vm" {
  description = "Указатель клонирования ВМ"
  default     = "false"
}
variable "cluster_id" {
  description = "ID кластера"
  default     = ""
}
variable "template_id" {
  description = "ID шаблона для ВМ"
  default     = ""
}
variable "vm_os_type" {
  description = "Тип гостевой ОС ВМ"
  default     = ""
}
variable "vm_cpu_cores" {
  description = "Количество ядер CPU"
  default     = "4"
}
variable "vm_cpu_sockets" {
  description = "Количество сокетов CPU"
  default     = "1"
}
variable "vm_cpu_threads" {
  description = "Количество потоков CPU"
  default     = "1"
}
variable "vm_memory_mb" {
  description = "Количество оперативной памяти ВМ В МЕГАБАЙТАХ"
  default     = 8192
}
variable "vm_max_memory_mb" {
  description = "Максимальное количество памяти"
  default     = 8192
}
variable "vm_custom_script" {
  description = "Пользовательский скрипт для ВМ"
  default     = ""
}
variable "vm_placement_policy_affinity" {
  description = "Политика сходства для размещения"
  default     = "migratable"
}

locals {
  vm_memory_bytes     = var.vm_memory_mb * 1024 * 1024
  vm_max_memory_bytes = var.vm_max_memory_mb * 1024 * 1024
}
