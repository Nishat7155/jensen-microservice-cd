###############################################################################
#
# Required Values
#
###############################################################################

variable "project_id" {
  description = "The ID of a Google Project "
  type        = string
}

variable "environment" {
  description = "GCP environment of deployment e.g. stage"
  type        = string
}

###############################################################################
#
# Optional Values
#
###############################################################################

variable "gcp_service_list" {
  description = "List of gcp APIs that are used"
  type        = list(string)
  default = [
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudscheduler.googleapis.com",
    "cloudtasks.googleapis.com",
    "datastore.googleapis.com",
    "eventarc.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "identitytoolkit.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "serviceusage.googleapis.com",
    "run.googleapis.com",
    "secretmanager.googleapis.com"
  ]
}

variable "location" {
  description = "Location of the bucket"
  type        = string
  default     = "EU"
}

variable "region" {
  description = "Region of the bucket"
  type        = string
  default     = "europe-west3"
}
