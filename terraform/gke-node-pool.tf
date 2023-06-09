resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "n1-standard-1"
    disk_size_gb = 25

    tags         = ["${var.project_id}-node", var.project_id]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    labels = {
      env = var.project_id
    }
  }
}