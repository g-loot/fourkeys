terraform {
  required_version = ">= 1.0"

  backend "gcs" {
    bucket  = "tf-fourkeys"
    prefix  = "terraform/state"
  }

  required_providers {
    google = {
      version = "~> 3.85.0"
    }
  }
}

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
}

resource "google_service_account" "fourkeys" {
  account_id   = "fourkeys"
  display_name = "Service Account for Four Keys resources"
}
