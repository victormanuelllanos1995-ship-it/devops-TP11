output "environment" {
  value = var.environment
}

output "project_name" {
  value = var.project_name
}

output "frontend_url" {
  value = "http://localhost:${var.frontend_port}"
}

output "app_network_id" {
  value = module.network.app_network_id
}

output "monitoring_network_id" {
  value = module.network.monitoring_network_id
}

output "postgres_volume" {
  value = module.storage.postgres_volume_name
}

output "grafana_volume" {
  value = module.storage.grafana_volume_name
}

output "prometheus_volume" {
  value = module.storage.prometheus_volume_name
}
