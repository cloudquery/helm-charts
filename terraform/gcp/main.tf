module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.name
  regional                   = false
  zones                      = var.zones
  network                    = "default"
  subnetwork                 = "default"
  ip_range_services = ""
  ip_range_pods = ""
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "n2-standard-2"
      min_count                 = 1
      max_count                 = 2
      local_ssd_count           = 1
      disk_size_gb              = 100
      disk_type                 = "pd-ssd"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = false
      initial_node_count        = 1
      remove_default_node_pool          = true
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }
}