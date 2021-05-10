resource "google_compute_instance" "vm_instance" {
  name         = "demo-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = "default"
  }
}


