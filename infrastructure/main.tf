terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.40.0"
    }
  }
  backend "gcs" {}

}

provider "google" {
  project = var.project_id
  region  = "europe-west3"
}

resource "google_project_service" "project-apis" {
  for_each                   = toset(var.gcp_service_list)
  service                    = each.value
  disable_dependent_services = true
}

resource "google_cloud_run_service" "jensen-micro-service" {
  name     = "allen-demo"
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.container_image
        ports {
          container_port = "8080"
        }
      }
      service_account_name = var.cloudrun_sa
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "5"
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.be.location
  project  = google_cloud_run_service.be.project
  service  = google_cloud_run_service.be.name

  policy_data = data.google_iam_policy.noauth.policy_data
}


