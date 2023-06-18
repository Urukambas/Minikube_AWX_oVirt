variable "ovirt_url" {
  description = "URL API zVirt"
}
variable "ovirt_username" {
  description = "Имя пользователя zVirt"
  sensitive   = true
}
variable "ovirt_password" {
  description = "Пароль пользователя zVirt"
  sensitive   = true
}
variable "ovirt_tls_ca" {
  description = "Путь к корневому сертификату zVirt"
}

