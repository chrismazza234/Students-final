provider "google" {
  credentials = file("path/to/your/gcp/credentials.json")
  project     = "fair-yew-421221"
  region      = "us-central1"
}

resource "google_compute_instance" "portainer" {
  name         = "portainer-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = file("scripts/portainer.sh")
}

resource "google_compute_instance" "wordpress" {
  name         = "wordpress-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = file("scripts/wordpress.sh")
}

resource "google_compute_instance" "ollama" {
  name         = "ollama-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
}

  metadata_startup_script = file("scripts/ollama.sh")
}
