module "network_vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "8.0.0"

  project_id                                = var.google_cloud_project_id
  network_name                              = "mgcpnetwork"
  shared_vpc_host                           = false
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"

}

# Subnetwork to host our server
resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets

  name          = each.key
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = module.network_vpc.network_name
}


resource "google_compute_instance" "instances" {
  for_each = var.instance_configurations

  name         = each.key
  machine_type = "n1-standard-1"
  zone         = each.value.zone
  project      = var.google_cloud_project_id

  network_interface {
    network = module.network_vpc.network_self_link
    # subnetwork = try(lookup(google_compute_subnetwork.subnets, each.value.subnetwork_name, null).self_link, null)
    subnetwork = each.value.subnetwork_name

  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  metadata_startup_script = file("${path.module}/user_data_script.sh")
}











