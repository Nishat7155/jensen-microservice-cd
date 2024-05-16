



resource "google_service_account" "wif_service_account" {
  project      = var.project_id
  account_id   = "allen-demo"
  display_name = "Github Actions CICD Service Account for allen-demo"
  description  = "Service account used for Github Actions from repository allen-demo"
}

resource "google_project_iam_member" "wif_service_account_deploy" {
  project = var.project_id
  role    = google_project_iam_custom_role.deploy_role_allen-demo.id
  member  = "serviceAccount:${google_service_account.wif_service_account.email}"
}
