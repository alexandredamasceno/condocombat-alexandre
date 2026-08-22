# Define as URLs previsíveis para evitar dependência circular entre Backend e Frontend
locals {
  backend_url  = "https://condocombat-backend.onrender.com"
  frontend_url = "https://condocombat-frontend.onrender.com"
}

resource "render_web_service" "backend" {
  name              = "condocombat-backend"
  plan              = "free"
  region            = "oregon"
  runtime           = "docker"
  image_url         = "docker.io/${var.dockerhub_username}/condocombat-backend:latest"
  health_check_path = "/health"

  env_vars = {
    DATABASE_URL       = { value = local.database_url }
    SECRET_KEY         = { value = var.backend_secret_key }
    CORS_ORIGINS       = { value = local.frontend_url }
  }
}