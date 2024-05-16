resource "google_service_account" "jensen-microservice" {
  project      = var.project_id
  account_id   = "jensen"
  display_name = "Cloud Run identity"
  description  = "Service account used as identity for pdf-converter"
}



resource "google_project_iam_member" "jensen-microservice" {
  role    = google_project_iam_custom_role.identity_role.id
  member  = "serviceAccount:${google_service_account.jensen-dev.iam.gserviceaccount.email}"
  project = var.project_id
}
