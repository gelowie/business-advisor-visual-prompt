#!/usr/bin/env bash
# verify-badges.sh — the README badges must tell the truth, and no other file may carry badges.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
fail=0
ok()  { printf 'PASS  %s\n' "$1"; }
bad() { printf 'FAIL  %s\n' "$1"; fail=1; }

# 1. Version badge = latest CHANGELOG release
latest="$(grep -m1 -oE '^## \[[0-9]+\.[0-9]+\.[0-9]+\]' CHANGELOG.md | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"
if [ -n "$latest" ]; then ok "latest CHANGELOG version is $latest"; else bad "no release heading found in CHANGELOG.md"; fi
v="$(grep -oE 'badge/version-[0-9]+\.[0-9]+\.[0-9]+' README.md | head -1 | sed 's#badge/version-##')"
[ "$v" = "$latest" ] && ok "README version badge = $latest" || bad "README version badge is '${v:-missing}', CHANGELOG says '$latest'"

# 2. License badge matches the LICENSE file
head -1 LICENSE | grep -q '^MIT License' && ok "LICENSE is MIT" || bad "LICENSE does not start with 'MIT License'"
grep -q 'badge/license-MIT' README.md && ok "README license badge present" || bad "README missing license-MIT badge"

# 3. Template count badge = real template count
n="$(ls assets/prompt-templates/T*.md 2>/dev/null | wc -l | tr -d ' ')"
b="$(grep -oE 'badge/templates-[0-9]+' README.md | grep -oE '[0-9]+$' | head -1)"
[ "$n" = "${b:-}" ] && ok "templates badge ($b) = template files ($n)" || bad "templates badge '${b:-missing}' but $n template files"

# 4. README carries the full badge set
for k in 'skill-business--advisor--visual--prompt' 'type-AI_skill' 'type-agent_skill' 'works_with-any_AI_or_agent' 'role-prompt_builder' 'connected_to-business--advisor--pro' 'checks-shell_scripts'; do
  grep -qF "badge/$k" README.md || bad "README missing badge: $k"
done
grep -qE 'badge/connected_to-business--advisor-[0-9A-Fa-f]{6}' README.md || bad "README missing badge: connected to business-advisor"
ok "README badge set complete"

# 5. Badges appear only in README.md
leak="$(grep -rl 'img.shields.io' . --include='*.md' 2>/dev/null | grep -v '^./README.md$' || true)"
[ -z "$leak" ] && ok "no badges outside README.md" || bad "badges found outside README.md: $leak"

exit $fail
