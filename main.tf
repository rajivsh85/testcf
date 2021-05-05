provider "google" {
  project = "My First Project"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-a"
  version = "3.51.0"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}


