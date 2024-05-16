resource "google_project_iam_custom_role" "deploy_role_allen-demo" {
  role_id     = "customRoleDeploy"
  title       = "Deploy Custom Role allen-demo"
  description = "Custom role for deploy workflows of pdf-converter"
  permissions = [
    "artifactregistry.repositories.uploadArtifacts",
    "artifactregistry.repositories.downloadArtifacts",
    "artifactregistry.tags.create",
    "artifactregistry.tags.get",
    "artifactregistry.tags.list",
    "artifactregistry.tags.update",
    "cloudfunctions.functions.create",
    "cloudfunctions.functions.delete",
    "cloudfunctions.functions.get",
    "cloudfunctions.functions.getIamPolicy",
    "cloudfunctions.functions.setIamPolicy",
    "cloudfunctions.functions.sourceCodeSet",
    "cloudfunctions.functions.update",
    "cloudfunctions.operations.get",
    "compute.backendServices.create",
    "compute.backendServices.get",
    "compute.globalOperations.get",
    "compute.globalAddresses.create",
    "compute.globalAddresses.get",
    "compute.globalForwardingRules.create",
    "compute.globalForwardingRules.get",
    "compute.regionOperations.get",
    "compute.regionNetworkEndpointGroups.use",
    "compute.regionNetworkEndpointGroups.create",
    "compute.regionNetworkEndpointGroups.get",
    "compute.sslCertificates.create",
    "compute.sslCertificates.get",
    "compute.targetHttpProxies.create",
    "compute.targetHttpProxies.get",
    "compute.targetHttpsProxies.create",
    "compute.targetHttpsProxies.get",
    "compute.urlMaps.create",
    "compute.urlMaps.get",
    "compute.securityPolicies.create",
    "compute.securityPolicies.get",
    "compute.securityPolicies.delete",
    "compute.securityPolicies.update",
    "compute.backendServices.update",
    "compute.backendServices.setSecurityPolicy",
    "compute.securityPolicies.use",
    "logging.logEntries.create",
    "iam.serviceAccounts.actAs",
    "pubsub.schemas.attach",
    "pubsub.schemas.commit",
    "pubsub.schemas.create",
    "pubsub.schemas.delete",
    "pubsub.schemas.get",
    "pubsub.schemas.list",
    "pubsub.schemas.listRevisions",
    "pubsub.topics.attachSubscription",
    "pubsub.topics.create",
    "pubsub.topics.delete",
    "pubsub.topics.detachSubscription",
    "pubsub.topics.get",
    "pubsub.topics.getIamPolicy",
    "pubsub.topics.list",
    "pubsub.topics.setIamPolicy",
    "pubsub.topics.update",
    "pubsub.topics.updateTag",
    "resourcemanager.projects.get",
    "run.revisions.list",
    "run.services.create",
    "run.services.delete",
    "run.services.get",
    "run.services.getIamPolicy",
    "run.services.setIamPolicy",
    "run.services.update",
    "storage.buckets.create",
    "storage.buckets.delete",
    "storage.buckets.get",
    "storage.buckets.list",
    "storage.objects.get",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.list",
    "serviceusage.services.list"

  ]
}
