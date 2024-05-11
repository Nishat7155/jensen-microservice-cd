locals {
  labels_shared = {
    terraformed   = "true"
    initial-setup = "true"
  }
  labels_allen-demo        = merge(local.labels_shared, { application = "allen-demo" })
 
}

resource "google_project_service" "project_apis" {
  for_each                   = toset(var.gcp_service_list)
  service                    = each.value
  disable_dependent_services = true
}

resource "google_artifact_registry_repository" "allen-demo" {
  location      = var.region
  repository_id = "allen-demo"
  description   = "Repository for customer admin allen-demo service"
  format        = "DOCKER"

  depends_on = [google_project_service.project_apis]
}



