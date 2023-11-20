terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.6.0"
    }
  }
}

provider "google" {
  credentials = file("my-key.json")
  project     = var.google_cloud_project_id
  region      = "us-cental1"
}

