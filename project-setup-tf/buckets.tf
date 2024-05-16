resource "google_storage_bucket" "jense-tftsate" {
  name                        = "pdf-converter-tfstaste-${var.environment}"
  location                    = var.location
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}

