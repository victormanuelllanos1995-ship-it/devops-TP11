resource "docker_image" "postgres" {
  name         = var.postgres_image
  keep_locally = true
}

resource "docker_image" "backend" {
  name = var.backend_image

  keep_locally = true
}

resource "docker_image" "frontend" {
  name         = var.frontend_image
  keep_locally = true
}

resource "docker_container" "postgres" {
  name  = "${var.project_name}-${var.environment}-postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=devops",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  networks_advanced {
    name = var.app_network_name
  }

  mounts {
    source = var.postgres_volume_name
    target = "/var/lib/postgresql/data"
    type   = "volume"
  }

  restart = "unless-stopped"
}

resource "docker_container" "backend" {
  count = var.backend_replicas

  name    = "${var.project_name}-${var.environment}-backend-${count.index + 1}"
  image   = docker_image.backend.image_id
  command = ["python", "-c", "import time; time.sleep(999999)"]
  env = [
    "DATABASE_HOST=${docker_container.postgres.name}",
    "DATABASE_NAME=${var.postgres_db}"
  ]

  networks_advanced {
    name = var.app_network_name
  }

  restart = "unless-stopped"
}

resource "docker_container" "frontend" {
  name  = "${var.project_name}-${var.environment}-frontend"
  image = docker_image.frontend.image_id

  ports {
    internal = 80
    external = var.frontend_port
  }

  networks_advanced {
    name = var.app_network_name
  }

  restart = "unless-stopped"
}
