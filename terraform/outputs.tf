output "domain" {
  description = "The website domain"
  value       = local.domain
}

output "a_record_ids" {
  description = "Cloudflare DNS record IDs for the A records"
  value       = cloudflare_dns_record.squarespace_a[*].id
}
