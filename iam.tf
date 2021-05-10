# iam roles
locals {
  vm_svc_account_roles = [
    "roles/iam.serviceAccountUser",
    "roles/monitoring.metricWriter",
    "roles/logging.logWriter",
    "roles/storage.objectCreator"
  ]
}


### Compute Service Account
# Create the service account that the VM's will run as
resource "google_service_account" "sag-svc-account" {
  account_id   = "vm-svc-account"
  display_name = "VM Compute Service Account"
}
# Grant the compute service account the neccessary permissions
resource "google_project_iam_member" "sag-svc-account" {
  count   = length(local.vm_svc_account_roles)
  project = "codefresh-312809"
  role    = local.vm_svc_account_roles[count.index]
  member  = format("serviceAccount:%s",google_service_account.sag-svc-account.email)
}
