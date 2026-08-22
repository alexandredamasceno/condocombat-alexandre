resource "supabase_project" "db_condocombat" {
  organization_id   = var.supabase_org_id
  name              = "CondoCombat-DB"
  database_password = var.supabase_db_password
  region            = "sa-east-1" # São Paulo
}
