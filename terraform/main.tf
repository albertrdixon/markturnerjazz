provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

locals {
  domain = "markturnerjazz.org"

  # Squarespace IP addresses for custom domains
  # https://support.squarespace.com/hc/en-us/articles/205812378
  squarespace_ips = [
    "198.185.159.144",
    "198.185.159.145",
    "198.49.23.144",
    "198.49.23.145",
  ]
}

# A records pointing to Squarespace
resource "cloudflare_dns_record" "squarespace_a" {
  count = length(local.squarespace_ips)

  zone_id = var.cloudflare_zone_id
  name    = local.domain
  type    = "A"
  content = local.squarespace_ips[count.index]
  ttl     = 1 # automatic
  proxied = false
  comment = "Squarespace hosting"
}

# www CNAME
resource "cloudflare_dns_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  type    = "CNAME"
  content = local.domain
  ttl     = 1 # automatic
  proxied = false
  comment = "www redirect to apex"
}

# Squarespace domain verification TXT record
resource "cloudflare_dns_record" "squarespace_verify" {
  count = var.squarespace_verification_code != "" ? 1 : 0

  zone_id = var.cloudflare_zone_id
  name    = local.domain
  type    = "TXT"
  content = var.squarespace_verification_code
  ttl     = 1 # automatic
  comment = "Squarespace domain verification"
}
