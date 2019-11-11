resource "google_compute_instance" "db" {
  name = var.instance_db_name
  machine_type = "g1-small"
  zone = var.zone
    tags = ["reddit-db"]
    boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata= {
    ssh-keys = "ustmish:${file(var.public_key_path)}"
  }
 }
resource "google_compute_firewall" "firewall_mongo" {
  name = var.firewall_mongo_name
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app-stage"]
}

