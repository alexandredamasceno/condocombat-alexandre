resource "render_web_service" "backend" {
  name        = "condocombat-backend"
  plan        = "free"
  region      = "oregon"
  runtime     = "docker"
  image_url   = "${var.dockerhub_username}/condocombat-backend:latest"
  owner_id    = var.render_owner_id

  env_vars = {
    DATABASE_URL        = "postgresql://postgres:${var.supabase_db_password}@db.${supabase_project.db_condocombat.id}.supabase.co:5432/postgres"
    BACKEND_SECRET_KEY  = var.backend_secret_key
  }
}