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
  credentials = "/root/.config/gcloud/legacy_credentials/vy.mishukov@gmail.com/adc.json"
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  zone            = var.zone
  app_disk_image  = var.app_disk_image
  app_name = var.app_name
  ip_name = var.ip_name
  firewall_puma_name = var.firewall_puma_name
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  zone            = var.zone
  db_disk_image   = var.db_disk_image
  instance_db_name = var.instance_db_name
  firewall_mongo_name = var.firewall_mongo_name
}
module "vpc" {
  source          = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
  ssh_name = var.ssh_name
}
