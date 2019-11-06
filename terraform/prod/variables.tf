variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}

variable zone {
  description = "Region Instance"
  default     = "europe-west1-b"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}

variable app_name{
  description = "application name"
  default = "reddit-app"
}
variable ip_name{
  description = "name of ip resource"
}
variable firewall_puma_name{
  description = "firewall puma name"
}

variable instance_db_name{
  description = "name of instance"
}
variable firewall_mongo_name{
  description = "firewall_mongo_name"
}
variable ssh_name{
  description = "firewall name for ssh access"
}

