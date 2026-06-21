#!/usr/bin/env bash
# Render the logo SVGs to transparent high-res PNGs using headless Chrome.
# Re-run after editing any SVG:  ./assets/logo/generate-pngs.sh
set -euo pipefail
cd "$(dirname "$0")"

CHROME="$(command -v google-chrome || command -v google-chrome-stable)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p png

render() {
  local name="$1" w="$2" h="$3"
  cat > "$TMP/$name.html" <<EOF
<!doctype html><html><head><meta charset="utf-8"><style>
  html,body{margin:0;padding:0;background:transparent}
  img{display:block;width:${w}px;height:${h}px}
</style></head><body><img src="file://$PWD/$name.svg"></body></html>
EOF
  "$CHROME" --headless=new --disable-gpu --no-sandbox --hide-scrollbars \
    --force-device-scale-factor=1 --default-background-color=00000000 \
    --virtual-time-budget=3000 --window-size="${w},${h}" \
    --screenshot="$PWD/png/$name.png" "$TMP/$name.html" >/dev/null 2>&1
  echo "  png/$name.png  (${w}x${h})"
}

echo "Rendering PNGs..."
render narke-flis-emblem-color       1000 1000
render narke-flis-emblem-reverse     1000 1000
render narke-flis-emblem-mono-green  1000 1000
render narke-flis-emblem-mono-black  1000 1000
render narke-flis-icon-color         1000 1000
render narke-flis-horizontal         1080  340
render narke-flis-stacked             640  760
echo "Done."
