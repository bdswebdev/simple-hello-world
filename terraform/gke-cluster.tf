resource "google_container_cluster" "primary" {
  name     = "${var.project_id}--primary"
  location = var.region
  
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  remove_default_node_pool = true
  initial_node_count       = 1
  
  node_config {
    disk_size_gb = 25
    tags         = ["${var.project_id}-node", var.project_id]
  }
}