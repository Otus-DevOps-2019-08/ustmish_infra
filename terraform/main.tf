terraform {
  # Версия terraform
  required_version = "0.12.8"
}

provider "google" {
  # Версия провайдера
  version = "2.15.0"
  # ID проекта
  project = var.project
  # project = "infra-253818"

  #region = "europe-west-1"
  region      = var.region
  #credentials = "/root/.config/gcloud/legacy_credentials/vy.mishukov@gmail.com/adc.json"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  #zone = "europe-west1-b"
  zone = var.zone
  tags = ["reddit-app"]
  metadata = {
    # путь до публичного ключа
    #ssh-keys = "ustmish:${file("~/.ssh/id_rsa.pub")}"
    ssh-keys = "ustmish:${file(var.public_key_path)} ustmish1:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      #image = "reddit-base"
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "ustmish"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}

