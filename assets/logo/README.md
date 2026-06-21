# Närke Flis AB — logo pack

Each logo comes in two formats:

- **SVG** (this folder) — vector, infinitely scalable, no quality loss. **Best for
  print and business-card generators** (upload the SVG and scale to any size).
- **PNG** (`png/` folder) — transparent background, high-resolution. **Best for
  email, documents, and quick previews** (opens in any app / phone).

To attach to an email, grab the matching `.svg` + `.png` pair.

| File (name) | Shape | Use it for |
|-------------|-------|-----------|
| `narke-flis-emblem-color` | Round emblem, full colour | **Primary logo.** Default everywhere on light backgrounds. |
| `narke-flis-emblem-reverse` | Round emblem, light version | Dark backgrounds (dark business cards, photos). |
| `narke-flis-emblem-mono-green` | Round emblem, one colour (green) | Single-ink printing, foil, embossing, stamps. |
| `narke-flis-emblem-mono-black` | Round emblem, one colour (black) | Black-and-white printing, fax, photocopies. |
| `narke-flis-icon-color` | Icon only (tree + chips, no text) | Favicon, social avatar, small spaces, stamps. |
| `narke-flis-horizontal` | Icon + name, side by side | Business-card top row, letterhead, email signature. |
| `narke-flis-stacked` | Icon above name | Centred business-card layouts, signage, stickers. |

## Colours (for a print shop)
- Forest green `#244D2A`
- Wood amber `#C8862A`
- Leaf green `#7AB85F`  ·  trunk brown `#8A5A22`  ·  cream `#F5F0E6`

## Regenerating the PNGs
After editing any `.svg`, re-render the PNGs with:

```bash
./assets/logo/generate-pngs.sh
```

(Uses headless Chrome; outputs transparent PNGs into `png/`.)

> Note: the SVGs use system fonts (a serif for the emblem banner, a sans for the
> wordmarks). The text is pinned to a fixed width so it always fits, but if a print
> shop needs the text as outlines/curves, ask them — or open the SVG in Inkscape and
> use *Path → Object to Path*.
