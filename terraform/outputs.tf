output "backend_url" {
  value = render_web_service.backend.url
}

output "frontend_url" {
  value = render_web_service.frontend.url
}

output "landing_page_url" {
  value = "https://${var.netlify_site_name}.netlify.app"
}

output "db_connection_string" {
  value     = "postgresql+asyncpg://postgres.${supabase_project.db_condocombat.id}:${var.supabase_db_password}@aws-0-sa-east-1.pooler.supabase.com:5432/postgres"
  sensitive = true # Protege a string de conexão nos logs
}
