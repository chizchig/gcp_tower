## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_vpc"></a> [network\_vpc](#module\_network\_vpc) | terraform-google-modules/network/google//modules/vpc | 8.0.0 |


## Resources

| Name | Type |
|------|------|
| [google_compute_instance.instances](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_subnetwork.subnets](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_configurations"></a> [instance\_configurations](#input\_instance\_configurations) | A map of instance configurations | <pre>map(object({<br>    zone            = string<br>    subnetwork_name = string<br>  }))</pre> | <pre>{<br>  "instance-01": {<br>    "subnetwork_name": "subnet-01",<br>    "zone": "us-central1-a"<br>  },<br>  "instance-02": {<br>    "subnetwork_name": "subnet-02",<br>    "zone": "europe-west3-b"<br>  }<br>}</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A map of subnets to create | <pre>map(object({<br>    ip_cidr_range = string<br>    region        = string<br>  }))</pre> | <pre>{<br>  "subnet-01": {<br>    "ip_cidr_range": "192.168.1.0/24",<br>    "region": "us-central1",<br>    "zone": "us-central1-a"<br>  },<br>  "subnet-02": {<br>    "ip_cidr_range": "192.168.2.0/24",<br>    "region": "europe-west3",<br>    "zone": "europe-west3-b"<br>  }<br>}</pre> | no |

## Outputs

No outputs.
