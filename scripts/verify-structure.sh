#!/usr/bin/env bash
# verify-structure.sh — required files, frontmatter hygiene, template inventory, line endings.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
fail=0
ok()  { printf 'PASS  %s\n' "$1"; }
bad() { printf 'FAIL  %s\n' "$1"; fail=1; }

# 1. Required files
required=(
  SKILL.md LICENSE README.md CHANGELOG.md DECISIONS.md TESTS.md
  references/question-bank.md references/research-guide.md references/target-map.md
  assets/output-format.md
  scripts/verify-all.sh scripts/verify-structure.sh scripts/verify-links.sh scripts/verify-templates.sh scripts/verify-badges.sh
)
templates=(T1-basic T2-operational T3-strategic T4-financial T5-marketing T6-people T7-legal-compliance T8-complex-multi T9-crisis T10-growth)
examples=(example-basic example-financial example-legal example-complex example-crisis example-repair)
for t in "${templates[@]}"; do required+=("assets/prompt-templates/$t.md"); done
for e in "${examples[@]}";  do required+=("assets/examples/$e.md"); done
missing=0
for f in "${required[@]}"; do [ -f "$f" ] || { bad "missing required file: $f"; missing=1; }; done
[ $missing -eq 0 ] && ok "all ${#required[@]} required files present"

# 2. LICENSE naming (siblings use LICENSE, not LICENSE.txt)
if [ -e LICENSE.txt ]; then bad "LICENSE.txt present; use LICENSE"; else ok "no LICENSE.txt"; fi

# 2b. LICENSE holder and final newline
grep -qE '^Copyright \(c\) [0-9]{4} Angelo MT$' LICENSE && ok "LICENSE copyright holder is Angelo MT" || bad "LICENSE copyright holder is not Angelo MT"
[ -z "$(tail -c1 LICENSE)" ] && ok "LICENSE ends with a newline" || bad "LICENSE has no final newline"

# 3. Frontmatter
first="$(sed -n 1p SKILL.md)"
if [ "$first" = "---" ]; then ok "SKILL.md starts with frontmatter"; else bad "SKILL.md frontmatter missing"; fi
name="$(sed -n '2,6p' SKILL.md | sed -n 's/^name: *//p' | head -1)"
if [ "$name" = "business-advisor-visual-prompt" ]; then ok "frontmatter name = business-advisor-visual-prompt"; else bad "frontmatter name is '$name'"; fi
desc="$(sed -n '2,8p' SKILL.md | sed -n 's/^description: *//p' | head -1)"
if [ -n "$desc" ]; then ok "description present (${#desc} chars)"; else bad "description missing"; fi
[ "${#desc}" -le 1024 ] && ok "description <= 1024 chars" || bad "description longer than 1024 chars"
case "$desc" in *'\n'*|*'\"'*) bad "description contains escaped sequences (\\n or \\\")";; *) ok "description has no escaped sequences";; esac
case "$desc" in \"*|\'*) bad "description is wrapped in quotes";; *) ok "description is a plain scalar";; esac
dashes="$(sed -n '1,12p' SKILL.md | grep -c '^---$')"
[ "$dashes" -ge 2 ] && ok "frontmatter is closed" || bad "frontmatter not closed"

# 4. Template inventory matches the SKILL.md table
for t in "${templates[@]}"; do
  grep -q "assets/prompt-templates/$t.md" SKILL.md || bad "SKILL.md table missing $t"
done
ok "SKILL.md template table checked"
for e in "${examples[@]}"; do
  grep -q "assets/examples/$e.md" SKILL.md || bad "SKILL.md does not reference $e"
done
ok "SKILL.md example references checked"
extra="$(ls assets/prompt-templates | grep -v -E '^T([1-9]|10)-.*\.md$' || true)"
[ -z "$extra" ] && ok "no unexpected files in assets/prompt-templates" || bad "unexpected: $extra"

# 5. No unexpected top-level entries
for e in $(ls -A); do
  case "$e" in SKILL.md|LICENSE|README.md|CHANGELOG.md|DECISIONS.md|TESTS.md|assets|references|scripts|.git|.gitignore) ;; *) bad "unexpected top-level entry: $e";; esac
done
ok "top-level entries checked"
# 8. Line endings and scripts
crlf="$(grep -rl $'\r' --include='*.md' --include='*.sh' --include=LICENSE . 2>/dev/null | grep -v '^./.git/' || true)"
[ -z "$crlf" ] && ok "no CRLF line endings" || bad "CRLF found in: $crlf"
for s in scripts/*.sh; do [ -x "$s" ] || bad "not executable: $s"; done
ok "scripts executable"

exit $fail
