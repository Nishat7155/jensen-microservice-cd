variable "project_id" {
  description = "The ID of a Google Project "
  type        = string
  default     = ""
}

variable "gcp_service_list" {
  description = "List of gcp APIs that are used"
  type        = list(any)
  default     = []
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

variable "dist_path" {
  description = "Path to dist directory containing the built files"
  type        = string
  default     = ""
}

variable "container_image" {
  description = "Path to docker image"
  type        = string
  default     = ""

}
variable "cloudrun_sa" {
  description = "Service Account used as identity for Cloud Run revision"
  type        = string
  default     = ""

}