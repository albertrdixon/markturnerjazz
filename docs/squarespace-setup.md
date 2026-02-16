# Squarespace Setup Runbook

Configuration decisions and setup steps for markturnerjazz.org on Squarespace.

## Account & Plan

1. Create account at squarespace.com
2. Select **Basic Commerce** plan (~$36/mo) — removes 3% transaction fee on store sales
3. Connect Stripe for payment processing

## Template Selection

Choose a musician/artist-oriented template. Look for:

- Full-width hero image support
- Clean, minimal typography
- Built-in events/calendar layout
- Commerce-ready

Evaluate current templates at setup time. "Paloma" or similar artist templates are a good starting point.

## Page Structure

### Home

- Full-width hero image (performance photo)
- Short bio blurb (2-3 sentences)
- Upcoming shows section (pull from Tour Dates)
- Featured album or latest release

### About / Bio

- Full biography text
- Press quotes section
- Downloadable press photos (high-res images in a gallery with download enabled)
- Press kit PDF link (optional, add later)

### Tour Dates

- Use Squarespace's built-in Events feature
- Each event includes: date, venue name, city, ticket link, optional description
- Configure to show upcoming events by default
- Past events archived automatically

### Music

- Album grid or list layout
- Each album links to external stores:
  - Bandcamp
  - ECM Records
  - Spotify
  - Apple Music
- Include album artwork and release year

### Store

- Physical merchandise: CDs, vinyl, t-shirts, etc.
- Use Squarespace Commerce for cart and checkout
- Configure shipping zones (US initially, expand later)
- Product photos, descriptions, prices, inventory tracking

### Contact

- Contact form for booking inquiries
- Management/booking email
- Social media links (Instagram, Facebook, etc.)

## Commerce Configuration

1. Enable Commerce in site settings
2. Connect Stripe account for payments
3. Configure shipping:
   - Flat rate shipping for US
   - Add international later if needed
4. Set up order notification emails
5. Configure tax settings (consult with Mark on sales tax obligations)

## Custom Domain Connection

1. In Squarespace: Settings → Domains → Connect a Domain
2. Enter `markturnerjazz.org`
3. Squarespace will provide a verification code
4. Add the verification code to `terraform/variables.tf` as `squarespace_verification_code`
5. Run `terraform apply` to create the DNS records
6. Wait for DNS propagation (can take up to 48 hours, usually faster)
7. Verify connection in Squarespace domain settings
8. Squarespace handles SSL automatically

## SEO Basics

1. Set site title: "Mark Turner | Jazz Tenor Saxophonist"
2. Set site description for search engines
3. Add social sharing image (a good performance photo)
4. Configure URL slugs for each page (e.g., /about, /tour, /music, /store, /contact)
5. Connect Google Analytics (optional)

## Social Media Integration

- Add social media links in site settings
- Enable social sharing buttons on relevant pages
- Connect Instagram feed if desired
