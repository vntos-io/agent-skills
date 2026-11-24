#!/usr/bin/env bash
# Zips each skill folder for the Claude app's "Upload a skill" (dist/<name>.zip, the folder at the zip's root).
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir dist
for d in skills/*/; do n=$(basename "$d"); (cd skills && zip -qrX "../dist/$n.zip" "$n"); echo "dist/$n.zip"; done
