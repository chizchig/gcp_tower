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
  project     = "your-google-project-id"
  region      = "your-preferred-region"
}

