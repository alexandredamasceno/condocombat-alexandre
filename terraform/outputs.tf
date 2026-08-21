output "backend_url" {
  value = render_web_service.backend.url
}

output "frontend_url" {
  value = render_web_service.frontend.url
}

output "landing_page_url" {
  value = netlify_site.landing.ssl_url
}


output "db_connection_string" {
  value     = supabase_project.db_condocombat.database_url
  sensitive = true # Protege a string de conexão nos logs
}
