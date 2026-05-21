#!/usr/bin/env bash
set -euo pipefail

BASE="${1:-base.img}"
OUT="out/blckswan-42-system.img"

mkdir -p out work
cp "$BASE" "$OUT"

echo "[*] Created placeholder patched image:"
echo "    $OUT"
echo
echo "Neste steg er ekte image-mount/erofs/ext4 patching i GitHub runner."
echo "For nå er repo-fabrikken klar."
