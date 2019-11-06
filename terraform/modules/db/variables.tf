variable zone {
  description = "Zone"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
variable instance_db_name{
  description = "name of instance"
}
variable firewall_mongo_name{
  description = "firewall_mongo_name"
}

