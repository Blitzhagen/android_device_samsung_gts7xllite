#!/bin/bash
# Regenerate ota/<device>.json after a release build.
# Run from the android tree root:  device/samsung/gts7xllite/ota/gen_ota_json.sh <tag>
#   <tag> = release tag WITHOUT the lineage- prefix, e.g. 20261015
set -euo pipefail
TAG="${1:?usage: gen_ota_json.sh <tag, e.g. 20261015>}"
DEVICE=gts7xllite
OUT="out/target/product/$DEVICE"
ZIP="lineage-21.0-$TAG-UNOFFICIAL-$DEVICE.zip"
[ -f "$OUT/$ZIP" ] || { echo "missing $OUT/$ZIP"; exit 1; }

DATETIME=$(grep -oP '^ro\.build\.date\.utc=\K\d+' "$OUT/system/build.prop")
SIZE=$(stat -c%s "$OUT/$ZIP")
ID=$(sha256sum "$OUT/$ZIP" | cut -d' ' -f1)
URL="https://github.com/Blitzhagen/android_device_samsung_gts7xllite/releases/download/lineage-21.0-$TAG/$ZIP"

python3 - "$DATETIME" "$ZIP" "$ID" "$SIZE" "$URL" > "$(dirname "$0")/$DEVICE.json" <<'PY'
import json, sys
dt, fn, sid, size, url = sys.argv[1:6]
print(json.dumps({"response": [{"datetime": int(dt), "filename": fn, "id": sid,
    "romtype": "UNOFFICIAL", "size": int(size), "url": url,
    "version": "21.0"}]}, indent=2))
PY
echo "wrote $(dirname "$0")/$DEVICE.json for $ZIP"
