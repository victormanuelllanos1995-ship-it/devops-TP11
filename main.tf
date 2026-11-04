module "network" {
  source = "./modules/network"

  project_name      = var.project_name
  environment       = var.environment
  network_subnet    = var.network_subnet
  monitoring_subnet = var.monitoring_subnet
}

module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  environment  = var.environment
}

module "app" {
  source = "./modules/app"

  project_name         = var.project_name
  environment          = var.environment
  postgres_image       = var.postgres_image
  postgres_password    = var.postgres_password
  postgres_db          = var.postgres_db
  backend_image        = var.backend_image
  backend_replicas     = var.backend_replicas
  frontend_image       = var.frontend_image
  frontend_port        = var.frontend_port
  app_network_name     = "${var.project_name}-${var.environment}-network"
  postgres_volume_name = module.storage.postgres_volume_name
}
