provider "google" {
  credentials = file("/home/student/Downloads/fair-yew-421221-d66cf7dc8eae.json")
  project     = "fair-yew-421221"
  region      = "us-east4"
}

resource "google_compute_instance" "portainer" {
  name         = "portainer-instance"
  machine_type = "e2-medium"
  zone         = "us-east4-a"  # Explicitly specify the zone for this instance

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
  zone         = "us-east4-b"   # Explicitly specify the zone for this instance

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
  zone         = "us-east4-c"  # Explicitly specify the zone for this instance

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
}

  metadata_startup_script = file("scripts/ollama.sh")
}
