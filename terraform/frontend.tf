resource "render_web_service" "frontend" {
  name      = "condocombat-frontend"
  plan      = "free"
  region    = "oregon"
  runtime   = "docker"
  image_url = "docker.io/${var.dockerhub_username}/condocombat-frontend:latest"

  env_vars = {
    NEXT_PUBLIC_API_URL = { value = local.backend_url }
  }
}