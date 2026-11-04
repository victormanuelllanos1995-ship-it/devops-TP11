resource "docker_volume" "postgres_data" {
  name = "${var.project_name}-${var.environment}-postgres-data"
}

resource "docker_volume" "grafana_data" {
  name = "${var.project_name}-${var.environment}-grafana-data"
}

resource "docker_volume" "prometheus_data" {
  name = "${var.project_name}-${var.environment}-prometheus-data"
}
