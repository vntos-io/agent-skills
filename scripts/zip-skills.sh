#!/usr/bin/env bash
# Zips each skill folder for the Claude and ChatGPT apps' skill upload (dist/<name>.zip, the folder at the zip's root).
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir dist
chmod -R u+rwX,go+rX skills  # ChatGPT rejects skills whose files are owner-only (600)
for d in skills/*/; do n=$(basename "$d"); (cd skills && zip -qrX "../dist/$n.zip" "$n"); echo "dist/$n.zip"; done
