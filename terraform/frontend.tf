resource "render_web_service" "frontend" {
  name        = "condocombat-frontend"
  plan        = "free"
  region      = "oregon"
  runtime     = "docker"
  image_url   = "${var.dockerhub_username}/condocombat-frontend:latest"
  owner_id    = var.owner_id

  env_vars = {
    NEXT_PUBLIC_API_URL = render_web_service.backend.url
  }
}
