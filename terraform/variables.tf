variable "cloudflare_api_token" {
  description = "Cloudflare API token with DNS edit permissions for markturnerjazz.org"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for markturnerjazz.org"
  type        = string
  sensitive   = true
}

variable "squarespace_verification_code" {
  description = "Squarespace domain verification TXT record value"
  type        = string
  default     = ""
}
