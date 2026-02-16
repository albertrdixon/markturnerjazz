# Mark Turner Jazz Website — Design

## Context

Mark Turner is an accomplished jazz tenor saxophonist who needs a professional website at markturnerjazz.org. He is not technically competent, so the site must be easy for him to manage from his Android phone. His brother (Albert, infrastructure engineer) will serve as technical admin. Content will be created from scratch. Eventually, content management may be handed off to an assistant.

The domain is registered through Cloudflare. A GitHub repo (albertrdixon/markturnerjazz) exists for any code and documentation.

## Decision: Squarespace + Terraform for DNS

After evaluating custom-built (headless CMS + static site, fully custom) vs. managed platform approaches, Squarespace was chosen because:

- Built-in mobile-friendly admin (Android)
- Built-in commerce for physical merch
- Built-in event/tour date management
- No code to maintain, no deployments
- Easy handoff to a non-technical assistant
- Musician-oriented templates available

Trade-off: Squarespace has no config-as-code API, so site setup is manual. DNS and Cloudflare configuration are managed via Terraform.

## Site Structure

### Pages

| Page | Purpose | Key Features |
|------|---------|-------------|
| **Home** | Landing page | Hero image, short bio blurb, upcoming shows teaser, featured album |
| **About / Bio** | Full biography | Long bio, press quotes, downloadable press photos |
| **Tour Dates** | Events | Squarespace events feature: date, venue, city, ticket link |
| **Music** | Discography | Links to Bandcamp, ECM, Spotify, Apple Music |
| **Store** | Physical merch | CDs, vinyl, shirts via Squarespace Commerce (Stripe) |
| **Contact** | Booking/inquiries | Contact form, social links, management info |

### Commerce

- Squarespace "Basic Commerce" plan (~$36/mo) — removes 3% transaction fee
- Payment processing via Stripe
- Physical items only; digital music links out to Bandcamp/ECM
- Shipping configuration for US (expand later if needed)

## Infrastructure (Terraform-managed)

### Cloudflare DNS

Records pointing markturnerjazz.org to Squarespace:

- A records: 198.185.159.144, 198.185.159.145, 198.49.23.144, 198.49.23.145
- CNAME: www → markturnerjazz.org (or Squarespace-provided target)
- TXT: Squarespace domain verification record
- Future: MX/SPF/DKIM if email is configured

### Cloudflare Settings

- SSL mode: Full
- Minimum TLS: 1.2
- HSTS enabled

### Terraform Workspace

- Name: `prod-personal-web-markturnerjazz` (or similar)
- Backend: Terraform Cloud
- Provider: Cloudflare ~> 3

## Repository Structure

```
markturnerjazz/
├── terraform/
│   ├── main.tf           # Cloudflare DNS records + zone settings
│   ├── variables.tf      # Zone ID, verification tokens
│   ├── outputs.tf        # Domain, nameservers
│   ├── versions.tf       # Provider versions, cloud backend
│   └── terraform.tf      # Cloud/remote backend config
├── docs/
│   ├── squarespace-setup.md   # Site config runbook
│   ├── content-guide.md       # Mark's how-to guide
│   └── plans/
│       └── 2026-02-16-website-design.md
└── README.md
```

## Documentation Deliverables

### squarespace-setup.md
Runbook documenting: template choice, page structure, commerce settings, payment config, SEO settings, domain connection steps. Enables recreating the site if needed.

### content-guide.md
Step-by-step guide for Mark covering: adding/editing tour dates, updating bio text, adding store products, uploading photos. Written for mobile (Android browser) experience.

## Content Dependencies (not in code scope)

Before launch, Mark needs to provide or create:
- Bio text (short + long versions)
- Press quotes from reviews
- Photos (headshots, performance shots)
- Current tour dates
- Store products (photos, descriptions, prices)

## Verification

1. Terraform: `terraform fmt`, `terraform validate`, `terraform plan` — DNS records resolve correctly
2. Domain: markturnerjazz.org loads the Squarespace site with valid SSL
3. Squarespace: all pages accessible, store checkout works, events display correctly
4. Mobile: Mark can log in and edit content from Android phone
5. Content guide: Mark follows guide to make a test update successfully
