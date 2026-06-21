# Närke Flis AB — business card

Two-sided design at the EU/Swedish standard **85 × 55 mm**.

| File | What |
|------|------|
| `business-card-front.svg` | Front (branding): emblem + tagline + web |
| `business-card-back.svg` | Back (contact): Tomas Karlsson + phone/email/web |
| `png/business-card-front.png` | Front, 1700×1100 px transparent (~508 dpi) |
| `png/business-card-back.png` | Back, 1700×1100 px transparent |
| `png/business-card-mockup.png` | Preview of both sides — good for email |

## For the print shop
- **Trim size:** 85 × 55 mm. Add **3 mm bleed** on each side if the printer asks
  (the SVG background colour can extend — currently it's edge-to-edge).
- **Safe margin:** keep important text ≥ 4 mm from the trim edge.
- **Colours:** forest green `#244D2A`, wood amber `#C8862A`, leaf green `#7AB85F`,
  cream `#F5F0E6`.
- Hand them the **SVG** for best quality (vector). The PNGs are a fallback.
- If they need text as outlines/curves, open the SVG in Inkscape → *Path → Object
  to Path*, or ask and I'll provide an outlined version.

## Editing
After changing either `.svg`, regenerate the PNGs + mockup:

```bash
./assets/business-card/generate.sh
```

> These files are **excluded from the published website** (see `/_config.yml`) —
> they live in the repo for reference only and are not served from narkeflis.com.
