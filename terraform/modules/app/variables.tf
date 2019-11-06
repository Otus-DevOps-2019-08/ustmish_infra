variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
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


