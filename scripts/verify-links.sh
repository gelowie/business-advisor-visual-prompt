#!/usr/bin/env bash
# verify-links.sh — every path reference resolves, and every file is reachable.
# Roots: SKILL.md (skill content) and README.md (repo documents).
# Broken-reference checks run on SKILL.md, README.md, references/ and assets/.
# CHANGELOG.md, DECISIONS.md and TESTS.md may cite historical paths, so they are
# checked for reachability only. Tokens that start with business-advisor (paths in
# the sibling skills) are skipped.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
fail=0
ok()  { printf 'PASS  %s\n' "$1"; }
bad() { printf 'FAIL  %s\n' "$1"; fail=1; }

refs_of() { # print path-like tokens referenced by file $1
  grep -oE '`[^` ]+\.(md|sh)`|\]\([^)]+\.(md|sh)\)' "$1" 2>/dev/null \
    | sed -E 's/^`//; s/`$//; s/^\]\(//; s/\)$//' | sort -u
}
resolve() { # $1 = referencing file, $2 = token; echo resolved path or nothing
  local dir; dir="$(dirname "$1")"
  [ -f "$2" ] && { echo "$2"; return; }
  [ -f "$dir/$2" ] && { echo "$dir/$2" | sed 's#^\./##'; return; }
}
checks_refs() { case "$1" in SKILL.md|README.md|references/*|assets/*) return 0;; *) return 1;; esac; }

declare -A seen
queue=(SKILL.md README.md)
seen[SKILL.md]=1; seen[README.md]=1
while [ ${#queue[@]} -gt 0 ]; do
  f="${queue[0]}"; queue=("${queue[@]:1}")
  while IFS= read -r tok; do
    [ -z "$tok" ] && continue
    case "$tok" in business-advisor*|http*) continue;; esac
    r="$(resolve "$f" "$tok")"
    if [ -z "$r" ]; then
      checks_refs "$f" && bad "broken reference in $f -> $tok"
      continue
    fi
    if [ -z "${seen[$r]:-}" ]; then seen[$r]=1; queue+=("$r"); fi
  done < <(refs_of "$f")
done
[ $fail -eq 0 ] && ok "all path references resolve"

unreach=0
while IFS= read -r f; do
  f="${f#./}"
  [ -z "${seen[$f]:-}" ] && { bad "unreachable file: $f"; unreach=1; }
done < <(find . -type f \( -name '*.md' -o -name '*.sh' \) -not -path './.git/*' | sort)
[ $unreach -eq 0 ] && ok "every .md and .sh file is reachable (${#seen[@]} files)"
exit $fail
