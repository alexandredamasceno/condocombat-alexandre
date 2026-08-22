resource "supabase_project" "db_condocombat" {
  organization_id   = var.supabase_org_id
  name              = "CondoCombat-DB"
  database_password = var.supabase_db_password
  region            = "sa-east-1"
}

# Monta a DATABASE_URL no formato assíncrono correto usando o Pooler IPv4
locals {
  database_url = "postgresql+asyncpg://postgres.${supabase_project.db_condocombat.id}:${var.supabase_db_password}@aws-0-sa-east-1.pooler.supabase.com:5432/postgres"
}