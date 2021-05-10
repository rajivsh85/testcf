resource "google_secret_manager_secret_iam_member" "test_secret_iam" {
  project   = "codefresh-2"
  secret_id = "test"
  role      = "roles/secretmanager.secretAccessor"
  member    = format("serviceAccount:%s",google_service_account.sag-svc-account.email)
}

resource "google_compute_instance" "vm_instance" {
  name         = "instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = "default"
  }
  service_account {
    email = google_service_account.sag-svc-account.email
    scopes = ["cloud-platform"]
  }
}


