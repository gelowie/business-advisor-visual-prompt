#!/usr/bin/env bash
# verify-all.sh — run every static check and report a single result.
set -u
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rc=0
for s in verify-structure.sh verify-links.sh verify-templates.sh verify-badges.sh; do
  echo "=== $s"
  bash "$DIR/$s" || rc=1
  echo
done
if [ $rc -eq 0 ]; then echo "RESULT: ALL STATIC CHECKS PASS"; else echo "RESULT: FAILURES FOUND"; fi
exit $rc
