data "netlify_site" "landing" {
  name = var.netlify_site_name
}

resource "terraform_data" "landing_deploy" {
  triggers_replace = [
    data.netlify_site.landing.id,
    timestamp() 
  ]

  provisioner "local-exec" {
    command = "npx --yes netlify-cli deploy --dir=${abspath("${path.module}/../landing/dist")} --prod --auth=${var.netlify_auth_token} --site=${data.netlify_site.landing.id}"
  }
}
