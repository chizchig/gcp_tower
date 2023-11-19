terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.6.0"
    }
  }
}

provider "google" {
  project = var.GOOGLE_CLOUD_PROJECT_ID
  region  = "us-central1"

}