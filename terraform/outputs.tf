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
  value     = "postgresql://postgres:${var.supabase_db_password}@db.${supabase_project.db_condocombat.id}.supabase.co:5432/postgres"
  sensitive = true # Protege a string de conexão nos logs
}
