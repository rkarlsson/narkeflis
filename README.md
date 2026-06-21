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

## Hosting (recommended: GitHub Pages — free)

Since the project already lives in a git repo, **GitHub Pages** is the simplest
free option. Steps:

1. Push this repo to GitHub (repo name `narkeflis`).
2. Repo **Settings → Pages → Build and deployment → Source: Deploy from a branch**,
   branch `main`, folder `/ (root)`. Save.
3. Under **Custom domain** enter `narkeflis.com` and save. Tick **Enforce HTTPS**.
4. At your domain registrar's DNS, add the web records below.
   **Leave the existing MX records alone** — they keep Google Workspace email working.

   For the apex `narkeflis.com`, add A/AAAA records pointing at GitHub Pages:
   ```
   A     @   185.199.108.153
   A     @   185.199.109.153
   A     @   185.199.110.153
   A     @   185.199.111.153
   AAAA  @   2606:50c0:8000::153
   AAAA  @   2606:50c0:8001::153
   AAAA  @   2606:50c0:8002::153
   AAAA  @   2606:50c0:8003::153
   ```
   And for `www`:
   ```
   CNAME  www   <your-github-username>.github.io.
   ```

GitHub Pages issues a free SSL certificate automatically once DNS resolves.

### Alternatives
- **Cloudflare Pages** — also free, faster global CDN, but easiest when the
  domain's nameservers are moved to Cloudflare (keep the Google MX records).
- **Netlify** — free tier, connect the GitHub repo and add the custom domain.

All three are free for a site this size.
