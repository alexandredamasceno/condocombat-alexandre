data "netlify_site" "landing" {
  name = var.netlify_site_name
}

resource "terraform_data" "landing_deploy" {
  triggers_replace = [
    data.netlify_site.landing.id,
    filesha1("${path.module}/../landing/dist/index.html")
  ]

  provisioner "local-exec" {
    command = "npx netlify-cli deploy --dir=${path.module}/../landing/dist --prod --auth=${var.netlify_auth_token} --site=${data.netlify_site.landing.id}"
  }
}