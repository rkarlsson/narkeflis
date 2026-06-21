# narkeflis

Static website for **Närke Flis AB** — a family-run wood chipping company in
Närke, Sweden (flisning på plats / on-site wood chipping).

Live domain: **narkeflis.com**

## What's here
| File | Purpose |
|------|---------|
| `index.html` | The whole site (single page, Swedish) |
| `styles.css` | Styling |
| `assets/logo.svg` | Standalone logo (for email signature, print, etc.) |
| `favicon.svg` | Browser tab icon |
| `CLAUDE.md` | Full project requirements / context |

No build step, no dependencies. Open `index.html` in a browser to preview.

## Hosting: GitHub Pages — free

The site is served from this repo by **GitHub Pages**. The repo root contains a
`CNAME` file holding `narkeflis.com`, which tells Pages to serve at the custom
domain. Pages is enabled to deploy from the `main` branch, root folder.

To go live, the domain's DNS (registrar: **GoDaddy**) must point at GitHub.

### GoDaddy DNS setup

Log in to GoDaddy → **My Products → Domains → narkeflis.com → DNS / Manage DNS**.

> ⚠️ **Leave the MX records alone.** They route email to Google Workspace. Only
> touch the web records (A / AAAA / CNAME) below.

1. **Apex domain (`narkeflis.com`).** GoDaddy ships a default `A` record for `@`
   pointing at a GoDaddy parking IP. **Edit/replace it** so there are four `A`
   records for `@` pointing at GitHub Pages (GoDaddy lets you add multiple `A`
   records with the same name — add the first, then "Add Record" for the rest):

   | Type | Name | Value | TTL |
   |------|------|-------|-----|
   | A | @ | 185.199.108.153 | 1 hour |
   | A | @ | 185.199.109.153 | 1 hour |
   | A | @ | 185.199.110.153 | 1 hour |
   | A | @ | 185.199.111.153 | 1 hour |

   Optionally also add the IPv6 `AAAA` records for `@`:
   `2606:50c0:8000::153`, `2606:50c0:8001::153`, `2606:50c0:8002::153`, `2606:50c0:8003::153`.

2. **`www` subdomain.** Add a `CNAME` record so `www.narkeflis.com` works too:

   | Type | Name | Value | TTL |
   |------|------|-------|-----|
   | CNAME | www | rkarlsson.github.io | 1 hour |

   With **both** the apex `A` records (step 1) and this `www` `CNAME` in place,
   GitHub Pages serves both hostnames and automatically **redirects
   `www.narkeflis.com` → `narkeflis.com`** over HTTPS. No extra config needed —
   the apex is the canonical address and `www` follows it.

   > GoDaddy note: GoDaddy adds a default `CNAME www → @` (or a parking value).
   > Edit that existing `www` record to point at `rkarlsson.github.io` rather than
   > adding a second one.

3. If GoDaddy has **domain Forwarding** set on the apex or on `www`, remove it —
   it conflicts with the records above.

DNS can take from a few minutes up to a few hours to propagate. Once it resolves,
GitHub Pages auto-issues a free SSL certificate; then tick **Enforce HTTPS** in
the repo's **Settings → Pages**.

Until DNS propagates, the site is also reachable at
`https://rkarlsson.github.io/narkeflis/`.

### Deploying changes
Just commit and push to `main` — GitHub Pages rebuilds automatically.

### Alternatives
- **Cloudflare Pages** — also free, faster global CDN, but easiest when the
  domain's nameservers are moved to Cloudflare (keep the Google MX records).
- **Netlify** — free tier, connect the GitHub repo and add the custom domain.

All three are free for a site this size.
