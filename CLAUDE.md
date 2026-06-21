# Närke Flis AB — Website

Static brochure website for **Närke Flis AB**, a small family-run wood chipping
company in Närke, Sweden. This file captures all project requirements so state is
easy to rebuild in future sessions.

## The business
- Run by **Tomas Karlsson** (father) and his other son (brother of the repo owner).
- They operate a **truck** that tows a large **wood chipping machine (flismaskin)**.
  They feed it with logs and produce woodchips (flis).
- **IMPORTANT — what the machine can/can't do:** it is a **chipper**, not a
  shredder/crusher. It processes **stockar och timmer (logs/timber) only**. It
  **cannot** handle grenar/ris (branches/brush) or anything with stones. Do not
  reintroduce "grenar"/"ris" into the copy.

## Contact details (live on the site)
- Company name (display everywhere): **Närke Flis AB** — note the **ä** in "Närke"
  (Närke is a province in Sweden). Always use the correct Swedish character.
- Contact person: **Tomas Karlsson**
- Email: **tomas@narkeflis.com** (Google Workspace)
- Phone: **+46 76 276 15 60**  → `tel:+46762761560`, displayed as `076-276 15 60` / `+46 76 276 15 60`

## Language
- **All visible text is in Swedish (`lang="sv"`).** Keep it that way.

## Services listed
- Currently one service: **Flisning på plats** (on-site chipping). Single-service
  page by choice — keep it simple, iterate later.

## Design
- **Logo:** round emblem — forest-green circle, amber double ring, pine tree +
  woodchips, banner reading **"NÄRKE FLIS AB"** (no tagline inside the logo).
  - Standalone file: `assets/logo.svg`. Favicon: `favicon.svg` (simplified emblem).
  - A header variant (cream circle on the green bar) is inlined in `index.html`.
- **Palette:** green-dark `#244d2a`, green `#2f6135`, green-light `#7ab85f`,
  amber `#c8862a`, amber-dark `#a96f1f`, cream `#f5f0e6`, ink `#2b2b2b`.
- **Imagery:** the truck + chipper is currently an inline **SVG illustration**
  (placeholder). Tomas will supply **real photos** later — swap them into the hero
  and add a small gallery if wanted. Tomas will also revise the copy to his liking.

## Page structure (single scrolling page, no dynamic content)
1. **Header** (sticky) — logo + "NÄRKE FLIS AB", tap-to-call phone button.
2. **Hero** — heading "Flisning på plats i Närke", intro line, truck+chipper SVG.
3. **Våra tjänster** — single card: "Flisning på plats".
4. **Kontakta oss** — Tomas Karlsson, clickable `tel:` and `mailto:`.
5. **Footer** — © Närke Flis AB · Närke, Sverige.

## Tech & conventions
- Plain **HTML + CSS only**. No build step, no JS framework, no dependencies.
- Files: `index.html`, `styles.css`, `favicon.svg`, `assets/logo.svg`.
- Mobile-first, responsive. Keep it dependency-free so any static host works.
- `CNAME` (apex domain), `_config.yml` (excludes README/CLAUDE from the published
  site) and the docs are GitHub-Pages plumbing — see Hosting below.

## Hosting / deployment
- Hosted on **GitHub Pages**, free, deploying from the `main` branch (root).
  Repo: `github.com/rkarlsson/narkeflis`. Live URL: https://narkeflis.com
  (also https://rkarlsson.github.io/narkeflis/ until DNS propagates).
- **Deploy = push to `main`.** Pages rebuilds automatically.
- `CNAME` file pins the custom domain `narkeflis.com`.
- `_config.yml` `exclude:` keeps `README.md` / `CLAUDE.md` from being served.
- Domain registrar is **GoDaddy** (DNS managed there). Full step-by-step DNS
  records are in `README.md`. **Do not touch the MX records** — email runs on
  Google Workspace. Only the web A/AAAA/CNAME records point at GitHub Pages.

## Roadmap / next steps
- [x] Hosting live on GitHub Pages. GoDaddy DNS points apex (4× A records) + `www`
      CNAME at GitHub. HTTPS cert issued and **Enforce HTTPS is on** — http/www
      both 301-redirect to https://narkeflis.com. MX kept on Google Workspace.
- [ ] Replace SVG illustration with Tomas's real photos.
- [ ] Apply Tomas's copy edits.
- [ ] Possible later additions: service area (kommuner), org.nr in footer, more services.
