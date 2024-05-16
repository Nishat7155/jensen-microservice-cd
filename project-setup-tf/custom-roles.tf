# resource "google_project_iam_custom_role" "identity_role" {
#   role_id     = "customRoleIdentity"
#   title       = "Cloud Run Identity Custom Role"
#   description = "Custom role for Cloud Run identity"
#   permissions = [
#     "iam.serviceAccounts.actAs",
#     "datastore.entities.get",
#     "datastore.entities.list",
#     "datastore.entities.create",
#     "datastore.entities.delete",
#     "datastore.entities.update",
#     "pubsub.topics.publish",
#     "secretmanager.versions.access"
#   ]
# }
