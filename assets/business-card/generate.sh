#!/usr/bin/env bash
# Render the business-card SVGs to PNG and build a presentation mockup.
# Re-run after editing either side:  ./assets/business-card/generate.sh
set -euo pipefail
cd "$(dirname "$0")"

CHROME="$(command -v google-chrome || command -v google-chrome-stable)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p png

# --- render each card side (transparent, 2x print res ~ 508dpi at 85x55mm) ---
render_card() {
  local name="$1"
  cat > "$TMP/$name.html" <<EOF
<!doctype html><html><head><meta charset="utf-8"><style>
  html,body{margin:0;padding:0;background:transparent}
  img{display:block;width:1700px;height:1100px}
</style></head><body><img src="file://$PWD/$name.svg"></body></html>
EOF
  "$CHROME" --headless=new --disable-gpu --no-sandbox --hide-scrollbars \
    --force-device-scale-factor=1 --default-background-color=00000000 \
    --virtual-time-budget=3000 --window-size=1700,1100 \
    --screenshot="$PWD/png/$name.png" "$TMP/$name.html" >/dev/null 2>&1
  echo "  png/$name.png  (1700x1100)"
}

echo "Rendering card sides..."
render_card business-card-front
render_card business-card-back

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
