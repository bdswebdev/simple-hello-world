output "region" {
  value       = var.region
  description = "Region"
}

output "project_id" {
  value       = var.project_id
  description = "Project Id"
}

output "cluster_name" {
  value       = google_container_cluster.primary.name
  description = "Cluster Name"
}