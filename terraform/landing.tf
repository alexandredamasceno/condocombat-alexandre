resource "netlify_site" "landing" {
  name = var.netlify_site_name
}

resource "netlify_site_deploy" "landing_deploy" {
  site_id     = netlify_site.landing.id
  dir         = "landing/dist" 
}