variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "devops-portfolio"
}

variable "postgres_image" {
  type    = string
  default = "postgres:16-alpine"
}

variable "postgres_password" {
  type      = string
  sensitive = true
}

variable "postgres_db" {
  type    = string
  default = "devops"
}

variable "backend_image" {
  type    = string
  default = "python:3.12-slim"
}

variable "backend_port" {
  type    = number
  default = 5000
}

variable "backend_replicas" {
  type    = number
  default = 2
}

variable "frontend_image" {
  type    = string
  default = "nginx:alpine"
}

variable "frontend_port" {
  type    = number
  default = 8080
}

variable "network_subnet" {
  type    = string
  default = "172.20.0.0/16"
}

variable "monitoring_subnet" {
  type    = string
  default = "172.21.0.0/16"
}
