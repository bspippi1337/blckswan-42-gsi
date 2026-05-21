#!/usr/bin/env bash
set -euo pipefail

IMG="${1:-out/blckswan-42-system.img}"

echo "[*] BLCKSWAN-42 flash helper"
echo "[*] image: $IMG"

[ -f "$IMG" ] || { echo "[!] Missing image: $IMG"; exit 1; }

fastboot getvar unlocked 2>&1 | grep -qi yes || {
  echo "[!] Bootloader does not report unlocked. Stopper her."
  exit 1
}

echo "[*] rebooting to fastbootd/userspace"
fastboot reboot fastboot || true
sleep 5

echo "[*] disabling verity/verification if supported"
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img 2>/dev/null || true

echo "[*] flashing system image"
fastboot flash system "$IMG"

echo "[*] wiping metadata/userdata may be required on first boot."
echo "[*] rebooting"
fastboot reboot
