terraform {
  required_version = "~> 1.6.2"


  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.60.0"
    }
  }
  backend "gcs" {}
}

provider "google" {
  project = var.project_id
}