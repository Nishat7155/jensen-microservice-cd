resource "google_service_account" "jensen-microservice" {
  project      = var.project_id
  account_id   = "jensen"
  display_name = "allen-demo Cloud Run identity"
  description  = "Service account used as identity for allen-demo"
}



resource "google_project_iam_member" "jensen-microservice" {
  role    = google_project_iam_custom_role.identity_role.id
  member  = "serviceAccount:${google_service_account.allen-demo.email}"
  project = var.project_id
}
