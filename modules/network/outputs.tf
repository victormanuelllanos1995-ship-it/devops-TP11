output "app_network_id" {
  value = docker_network.app_network.id
}

output "monitoring_network_id" {
  value = docker_network.monitoring_network.id
}
