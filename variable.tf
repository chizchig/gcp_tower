variable "google_cloud_project_id" {
  type      = string
  sensitive = true
  default = "roar1984"
}

variable "subnets" {
  description = "A map of subnets to create"
  type = map(object({
    ip_cidr_range = string
    region        = string
  }))
  default = {
    "subnet-01" = {
      ip_cidr_range = "192.168.1.0/24"
      region        = "us-central1"
      zone          = "us-central1-a"
    },
    "subnet-02" = {
      ip_cidr_range = "192.168.2.0/24"
      region        = "europe-west3"
      zone          = "europe-west3-b"
    }
  }
}

variable "instance_configurations" {
  description = "A map of instance configurations"
  type = map(object({
    zone            = string
    subnetwork_name = string
  }))
  default = {
    "instance-01" = {
      zone            = "us-central1-a"
      subnetwork_name = "subnet-01"
    },
    "instance-02" = {
      zone            = "europe-west3-b"
      subnetwork_name = "subnet-02"
    }
  }
}

