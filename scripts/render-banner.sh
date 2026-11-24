#!/usr/bin/env bash
# Re-renders assets/banner.png (README header and GitHub social preview) from scripts/banner.html.
set -euo pipefail
cd "$(dirname "$0")/.."
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --disable-gpu --hide-scrollbars \
  --window-size=1280,640 --virtual-time-budget=4000 --allow-file-access-from-files \
  --screenshot="$PWD/assets/banner.png" "file://$PWD/scripts/banner.html"
