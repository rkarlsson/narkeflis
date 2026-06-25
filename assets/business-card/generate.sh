#!/usr/bin/env bash
# Render the business-card SVGs to PNG and build a presentation mockup.
# Re-run after editing either side:  ./assets/business-card/generate.sh
set -euo pipefail
cd "$(dirname "$0")"

CHROME="$(command -v google-chrome || command -v google-chrome-stable)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p png

# Card trim size 85x55mm. At 600 dpi that is 2008x1299 px.
#   85mm / 25.4 * 600 = 2007.9 -> 2008    55mm / 25.4 * 600 = 1299.2 -> 1299
PX_W=2008; PX_H=1299; DPI=600

# --- render each card side (transparent, 600 dpi for 85x55mm) ---
render_card() {
  local name="$1"
  # Rasterise the SVG directly (screenshot the file, no <img> wrapper). The
  # committed .svg keeps mm units for correct print physical size; here we swap
  # them for the exact target pixel size and stretch-to-fill so the card fills
  # the frame edge-to-edge with no transparent border.
  sed -E 's/width="85mm" height="55mm"/width="'"$PX_W"'" height="'"$PX_H"'" preserveAspectRatio="none"/' \
    "$PWD/$name.svg" > "$TMP/$name.svg"
  # Render into a window taller than needed (headless Chrome's screenshot
  # viewport is ~87px shorter than the requested window height), then the
  # python step below crops back to the exact PX_W x PX_H.
  "$CHROME" --headless=new --disable-gpu --no-sandbox --hide-scrollbars \
    --force-device-scale-factor=1 --default-background-color=00000000 \
    --virtual-time-budget=3000 --window-size=${PX_W},$((PX_H + 200)) \
    --screenshot="$PWD/png/$name.png" "file://$TMP/$name.svg" >/dev/null 2>&1
  echo "  png/$name.png  (${PX_W}x${PX_H} @ ${DPI}dpi = 85x55mm)"
}

echo "Rendering card sides..."
render_card business-card-front
render_card business-card-back

# --- crop to exact size + embed physical-size (DPI) metadata = 85x55mm ---
python3 - "$PX_W" "$PX_H" "$DPI" <<'PY'
import sys
from PIL import Image
w, h, dpi = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])
for n in ("business-card-front", "business-card-back"):
    p = f"png/{n}.png"
    im = Image.open(p).crop((0, 0, w, h))   # trim the headless overscan
    im.save(p, dpi=(dpi, dpi))              # writes the PNG pHYs chunk
print(f"  cropped to {w}x{h} + embedded {dpi} dpi -> 85x55mm")
PY

# --- presentation mockup: both sides on a desk-grey background, with shadow ---
echo "Building mockup..."
cat > "$TMP/mockup.html" <<EOF
<!doctype html><html><head><meta charset="utf-8"><style>
  html,body{margin:0;padding:0;background:#dcd8cf}
  .stage{padding:48px 56px;display:flex;flex-direction:column;gap:44px;align-items:center}
  figure{margin:0;text-align:center}
  img{width:620px;height:401px;border-radius:18px;box-shadow:0 14px 34px rgba(0,0,0,.28);display:block}
  figcaption{font-family:Helvetica,Arial,sans-serif;font-size:18px;color:#6b6256;margin-top:12px;letter-spacing:1px}
</style></head><body>
  <div class="stage">
    <figure><img src="file://$PWD/png/business-card-front.png"><figcaption>FRAMSIDA</figcaption></figure>
    <figure><img src="file://$PWD/png/business-card-back.png"><figcaption>BAKSIDA</figcaption></figure>
  </div>
</body></html>
EOF
"$CHROME" --headless=new --disable-gpu --no-sandbox --hide-scrollbars \
  --force-device-scale-factor=2 --virtual-time-budget=3000 \
  --window-size=732,1130 --screenshot="$PWD/png/business-card-mockup.png" \
  "$TMP/mockup.html" >/dev/null 2>&1
echo "  png/business-card-mockup.png"
echo "Done."
