data "netlify_site" "landing" {
  name = var.netlify_site_name
}

# Aponta a Landing Page para a URL pública do seu Frontend
resource "netlify_environment_variable" "landing_public_app_url" {
  site_id = data.netlify_site.landing.id
  team_id = var.render_owner_id # Pode usar o seu render_owner_id como Team ID da Netlify se estiverem integrados, ou criar uma var para o netlify_team_id
  key     = "PUBLIC_APP_URL"
  values = [
    {
      context = "all"
      value   = local.frontend_url
    }
  ]
}

# Deploy da pasta dist de dentro do diretório landing
resource "terraform_data" "landing_deploy" {
  triggers_replace = [
    data.netlify_site.landing.id,
    local.frontend_url,
    filesha256("${path.module}/../landing/dist/index.html")
  ]

  provisioner "local-exec" {
    command     = "npx --yes netlify-cli deploy --dir=dist --prod --auth=$NETLIFY_AUTH_TOKEN --site=$NETLIFY_SITE_ID"
    working_dir = "${path.module}/../landing"
    environment = {
      NETLIFY_AUTH_TOKEN = var.netlify_auth_token
      NETLIFY_SITE_ID    = data.netlify_site.landing.id
    }
  }

  depends_on = [netlify_environment_variable.landing_public_app_url]
}
