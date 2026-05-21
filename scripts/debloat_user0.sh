#!/system/bin/sh
LIST="/sdcard/blckswan42/debloat-packages.txt"
[ -f "$LIST" ] || exit 0
while read p; do
  case "$p" in ""|\#*) continue ;; esac
  pm uninstall --user 0 "$p" >/dev/null 2>&1 || pm disable-user --user 0 "$p" >/dev/null 2>&1 || true
done < "$LIST"
