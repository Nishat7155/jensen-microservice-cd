resource "google_iam_workload_identity_pool" "pdf-converter" {
  project                   = var.project_id
  provider                  = google
  workload_identity_pool_id = "github-pdf-converter-demo"
  display_name              = "Github Identity Pool "
  description               = "Identity pool for Github Actions for allen-demo"
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "wif_provider" {
  depends_on = [
    google_iam_workload_identity_pool.allen-demo
  ]
  provider                           = google
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.allen-demo.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-provider"
  display_name                       = "Github Identity Pool Provider"
  description                        = "Identity pool provider for Github Actions."
  attribute_condition                = "attribute.repository in ['jensen-microservice-cd/pdf-converter']"
  attribute_mapping = {
    "google.subject"             = "assertion.sub"
    "attribute.repository"       = "assertion.repository"
    "attribute.repository_owner" = "assertion.repository_owner"
    "attribute.ref"              = "assertion.ref"
    "attribute.ref_type"         = "assertion.ref_type"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

data "google_iam_policy" "wif_service_account_policy" {
  binding {
    role = "roles/iam.workloadIdentityUser"

    members = [
      "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.pdf-converter.name}/attribute.repository/https://github.com/Nishat7155/jensen-microservice-cd/",
    ]
  }
}

resource "google_service_account_iam_policy" "wif_iam_policy_binding" {
  service_account_id = google_service_account.wif_service_account.name
  policy_data        = data.google_iam_policy.wif_service_account_policy.policy_data
}
