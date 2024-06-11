variable "domain_name" {
  description = "Номер аккаунта Selectel"
  type        = string
  sensitive = true
}

variable "username" {
  description = "Имя сервисного пользователя"
  type        = string
  sensitive = true
}

variable "password" {
  description = "Пароль сервисного пользователя"
  type        = string
  sensitive = true
}

variable "project_id" {
  description = "ID проекта"
  type        = string
  sensitive = true
}

variable "region" {
  description = "Регион"
  type        = string
  sensitive = true
}

variable "public_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
  sensitive = true
}

variable "private_key_path" {
  description = "Путь к приватному SSH-ключу"
  type        = string
  sensitive = true
}

variable "target_host" {
  description = "Хост, на который установливается пакеты из Ansible"
  type        = string
  sensitive = true
}

variable "ssh_user" {
  description = "Имя пользователя SSH для подключения к хосту"
  type        = string
  sensitive = true
}
