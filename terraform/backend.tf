resource "render_web_service" "backend" {
  name        = "condocombat-backend"
  plan        = "free"
  region      = "oregon"
  runtime     = "docker"
  image_url   = "${var.dockerhub_username}/condocombat-backend:latest"
  owner_id    = var.render_owner_id
  
  env_vars = {
    DATABASE_URL = supabase_project.db_condocombat.database_url
    BACKEND_SECRET_KEY = var.backend_secret_key
  }
}
