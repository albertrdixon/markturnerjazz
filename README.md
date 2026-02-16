# markturnerjazz.org

Website infrastructure and documentation for Mark Turner's jazz musician website.

## Architecture

- **Website**: Squarespace (managed platform)
- **DNS/Domain**: Cloudflare, managed via Terraform
- **Domain**: markturnerjazz.org

## Repository Structure

```
terraform/       # Cloudflare DNS configuration
docs/            # Setup runbook and content management guide
```

## Setup

1. Create Squarespace account and configure site (see `docs/squarespace-setup.md`)
2. Configure Terraform variables and apply DNS records (see `terraform/`)
3. Verify domain connection in Squarespace

## Content Management

See `docs/content-guide.md` for instructions on managing site content.
