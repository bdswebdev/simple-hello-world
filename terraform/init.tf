terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.63.1"
    }
  }

  required_version = ">= 1.4.0"
}


resource "google_project_service" "container" {
  project = var.project_id
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}


provider "google" {
  project = var.project_id
  region  = var.region
}

# resource "google_service_account" "default" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }