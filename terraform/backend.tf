# Define as URLs previsíveis para quebrar a dependência circular no Terraform
locals {
  backend_url  = "https://condocombat-backend.onrender.com"
  frontend_url = "https://condocombat-frontend.onrender.com"
}

resource "render_web_service" "backend" {
  name      = "condocombat-backend"
  plan      = "free"
  region    = "oregon"
  
  runtime_source = {
    image = {
      image_url = "docker.io/${var.dockerhub_username}/condocombat-backend"
      tag       = "latest"
    }
  }

  env_vars = {
    PORT = {
      value = "8000"
    }
    DATABASE_URL = {
      value = "postgresql+asyncpg://postgres.${supabase_project.db_condocombat.id}:${var.supabase_db_password}@aws-0-sa-east-1.pooler.supabase.com:5432/postgres"
    }
    SECRET_KEY = {
      value = var.backend_secret_key
    }
    CORS_ORIGINS = {
      value = "*" # Permite a conexão segura do Frontend
    }
  }
}