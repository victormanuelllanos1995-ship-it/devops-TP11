resource "docker_network" "app_network" {
  name   = "${var.project_name}-${var.environment}-network"
  driver = "bridge"

  ipam_config {
    subnet      = var.network_subnet
    gateway     = cidrhost(var.network_subnet, 1)
    aux_address = {}
  }

  labels {
    label = "project"
    value = var.project_name
  }

  labels {
    label = "environment"
    value = var.environment
  }
}

resource "docker_network" "monitoring_network" {
  name   = "${var.project_name}-${var.environment}-monitoring"
  driver = "bridge"

  ipam_config {
    subnet      = var.monitoring_subnet
    gateway     = cidrhost(var.monitoring_subnet, 1)
    aux_address = {}
  }
}
