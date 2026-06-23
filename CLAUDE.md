# Närke Flis AB — Website

Static brochure website for **Närke Flis AB**, a small family-run wood chipping
company in Närke, Sweden. This file captures all project requirements so state is
easy to rebuild in future sessions.

## The business
- Run by **Tomas Karlsson** (father) and **Johan Karlsson** (his other son /
  brother of the repo owner).
- They operate a **truck** + a **Bruks 1006 flistugg** (a heavy drum wood chipper).
- **What the machine processes:** **rundvirke (logs) och grot** (grot = grenar, ris
  och toppar / logging residue) → flis. Per the owner's own copy (2026-06-24) the
  Bruks 1006 handles both. NOTE: this supersedes an earlier note that said "stockar
  only, not grenar/ris" — the company corrected that with the actual machine model,
  so use "rundvirke och grot".
- **Location / area:** established on the border between **Närke and Östergötland**;
  work area is "där våra tjänster behövs i Sverige" (wherever needed in Sweden).

## Contact details (live on the site)
- Company name (display everywhere): **Närke Flis AB** — note the **ä** in "Närke"
  (Närke is a province in Sweden). Always use the correct Swedish character.
- **Tomas Karlsson** — *Administration och trafikledning*
  - Email: **tomas@narkeflis.com** (Google Workspace)
  - Phone: **+46 76 276 15 60** → `tel:+46762761560` (this is the header call button)
- **Johan Karlsson** — *Maskinförare / chaufför*
  - Phone: **+46 73 717 76 79** → `tel:+46737177679` (no email)
  - Bio: "Mer än 10 års branschvana – först genom Wåkab i Stockholmsområdet och
    sedermera NEG i Norge och Sverige."

## Language
- **All visible text is in Swedish (`lang="sv"`).** Keep it that way.

## Services listed
- **Flisning** — "Vi omvandlar rundvirke och grot till flis med vår Bruks 1006 flistugg."
- **Transport** — "Vi transporterar flisen med egna lastbilar om behov finns."

## Design
- **Logo:** round emblem — forest-green circle, amber double ring, pine tree +
  woodchips, banner reading **"NÄRKE FLIS AB"** (no tagline inside the logo).
  - Standalone file: `assets/logo.svg`. Favicon: `favicon.svg` (simplified emblem).
  - A header variant (cream circle on the green bar) is inlined in `index.html`.
  - **Logo pack** in `assets/logo/`: 7 variants (emblem-color, emblem-reverse,
    mono-green, mono-black, icon-color, horizontal, stacked) as SVG masters +
    transparent high-res PNGs in `assets/logo/png/`. Built/regenerated with
    `assets/logo/generate-pngs.sh` (headless Chrome). Banner/wordmark text is
    pinned with SVG `textLength` so it fits regardless of the viewer's fonts —
    keep that when editing or the text will overflow with a wide serif fallback.
  - **Business card** in `assets/business-card/`: front + back SVG (85×55 mm) +
    PNGs and a preview mockup, built with `assets/business-card/generate.sh`.
  - **All design assets are excluded from the published website** via `_config.yml`
    (`assets/logo`, `assets/logo.svg`, `assets/business-card`). They live in the
    repo for reference only and must NOT be served from narkeflis.com. The live
    site uses an inline SVG logo + root `favicon.svg`, so it needs nothing in
    `assets/`. If you add web photos later, put them in a *different* path (e.g.
    `img/`) so they aren't caught by these excludes.
- **Palette:** green-dark `#244d2a`, green `#2f6135`, green-light `#7ab85f`,
  amber `#c8862a`, amber-dark `#a96f1f`, cream `#f5f0e6`, ink `#2b2b2b`.
- **Imagery:** the hero now uses a **real photo** of the Bruks 1006 flistugg at
  `img/flistugg.jpg` (note: web photos live in `img/`, NOT `assets/`, so they are
  served — `assets/` is excluded from Pages). The old inline SVG truck/chipper
  illustration was removed. More photos / a gallery can be added later.

## Page structure (single scrolling page, no dynamic content)
1. **Header** (sticky) — logo + "NÄRKE FLIS AB", tap-to-call button (Tomas).
2. **Hero** — heading "Flisning av rundvirke och grot", intro line, photo of the
   Bruks 1006 with caption.
3. **Om oss** — location/area paragraph.
4. **Våra tjänster** — two cards: "Flisning" and "Transport".
5. **Kontakta oss** — two cards: Tomas Karlsson (tel + mailto) and Johan Karlsson
   (tel + bio).
6. **Footer** — © Närke Flis AB · Närke, Sverige.

## Tech & conventions
- Plain **HTML + CSS only**. No build step, no JS framework, no dependencies.
- Files: `index.html`, `styles.css`, `favicon.svg`, `img/flistugg.jpg`, `assets/logo.svg`.
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
- [x] Replaced SVG illustration with a real photo (`img/flistugg.jpg`, Bruks 1006).
- [x] Applied owner's copy edits (services, location, two contacts) — 2026-06-24.
- [ ] More photos / gallery when supplied.
- [ ] Possible later additions: org.nr in footer, more services.
