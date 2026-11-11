#!/usr/bin/env bash
# verify-templates.sh — content rules for templates, examples and shared docs.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
fail=0
ok()  { printf 'PASS  %s\n' "$1"; }
bad() { printf 'FAIL  %s\n' "$1"; fail=1; }
body() { awk '/^```text/{f=1;next} /^```$/{f=0} f' "$1"; }   # first fenced text block content

TPL=assets/prompt-templates
# 1. Required structure in every template
for f in $TPL/T*.md; do
  b="$(body "$f")"; n="$(basename "$f")"
  while IFS= read -r key; do
    echo "$b" | grep -qF -- "$key" || bad "$n missing: $key"
  done <<'KEYS'
In my words:
Business:
- Type: [service-based | digital product/SaaS | physical product/e-commerce | local brick-and-mortar]
Known (please don't re-ask):
Not provided yet:
Assumptions to verify (not confirmed):
Research context (unverified unless sourced):
Outcome I want:
KEYS
  grep -q '^\*\*Use when:\*\*' "$f" || bad "$n missing Use when"
  grep -q '^\*\*Level:\*\*' "$f" || bad "$n missing Level (internal classification)"
  grep -q '^## Rationale cue' "$f" || bad "$n missing Rationale cue"
  grep -q '^## Why this structure' "$f" && bad "$n repeats the delivered Why this structure block (owned by assets/output-format.md)"
done
ok "all templates carry the shared skeleton and a Rationale cue"

# 1b. T3 and T10 boundaries are explicit
for t in T1-basic T3-strategic T10-growth; do
  grep -q '^\*\*Not this template:\*\*' "$TPL/$t.md" || bad "$t missing its Not this template boundary"
done
grep -q 'T10' $TPL/T3-strategic.md && grep -q 'T3' $TPL/T10-growth.md || bad "T3 and T10 must point at each other"
grep -q '^### Boundaries' references/research-guide.md || bad "research guide lacks the Boundaries section"
ok "T1, T3 and T10 selection boundaries present"

# 2. Removed patterns must not return
for f in $TPL/T*.md assets/output-format.md assets/examples/*.md; do
  n="$f"
  grep -qiE '^you are a |step by step:|what i need from you|^summary:' "$f" && bad "$n contains a removed pattern (persona, Step by Step, numbered need list or Summary)"
done
grep -qi "cannot be solved in isolation" $TPL/T8-complex-multi.md && bad "T8 pre-judges routing"
ok "no persona line, duplicate answer-shape blocks or Summary"

# 3. Jurisdiction where law, tax, employment or funding is involved
for t in T4-financial T6-people T7-legal-compliance T8-complex-multi T9-crisis T10-growth; do
  body "$TPL/$t.md" | grep -q '^- Jurisdiction:' || bad "$t missing Jurisdiction field"
done
body "$TPL/T7-legal-compliance.md" | grep -q 'always required' || bad "T7 jurisdiction must be marked always required"
ok "jurisdiction fields present where required"

# 4. T4 inputs match the advisor's essential inputs
for k in 'Currency and basis' 'Cash balance now' 'Net burn' 'How customers pay' 'Revenue per period' 'Expenses per period'; do
  body "$TPL/T4-financial.md" | grep -q "$k" || bad "T4 missing: $k"
done
ok "T4 collects cash balance, burn, payment terms, currency and period"

# 5. T8 and T9 specifics
body "$TPL/T8-complex-multi.md" | grep -q 'Suspected links (my hypotheses, not conclusions)' || bad "T8 missing hypotheses block"
body "$TPL/T9-crisis.md" | grep -q 'Hard clock:' || bad "T9 missing Hard clock"
body "$TPL/T9-crisis.md" | grep -q 'Other problems in play' || bad "T9 missing other-problems field"
grep -q '^\*\*Level:\*\* Moderate for one problem, Complex when several problems interact' $TPL/T9-crisis.md || bad "T9 level must follow the interaction test"
ok "T8 and T9 follow the interaction-test rules"

# 6. No hardcoded calendar years in skill content (use {year} / current year)
yr="$(grep -rnE '(^|[^0-9])20[0-9]{2}([^0-9]|$)' SKILL.md references assets 2>/dev/null || true)"
[ -z "$yr" ] && ok "no hardcoded years in SKILL.md, references or assets" || { bad "hardcoded year found:"; echo "$yr"; }
grep -q '{year}' references/research-guide.md && ok "research guide uses a {year} placeholder" || bad "research guide lacks {year} placeholder"

# 7. Unsourced statistics: no percent figures in templates or references; examples only with Source:
pct="$(grep -nE '[0-9]+ ?(%|percent|per cent)' $TPL/*.md references/*.md SKILL.md assets/output-format.md || true)"
[ -z "$pct" ] && ok "no percent statistics in templates, references or SKILL.md" || { bad "percent figure found:"; echo "$pct"; }
expct="$(grep -nE '[0-9]+ ?(%|percent|per cent)' assets/examples/*.md | grep -v 'Source:' || true)"
[ -z "$expct" ] && ok "no unsourced percent figures in examples" || { bad "unsourced percent in examples:"; echo "$expct"; }

# 8. Examples follow the delivered output format
for f in assets/examples/*.md; do
  if [ "$(basename "$f")" = "example-repair.md" ]; then
    for k in '## 🔧 Prompt repair' '### Before → Fix → After' '### Revised prompt' '**Before:**' '**Fix:**' '**After:**'; do
      grep -qF -- "$k" "$f" || bad "$f missing: $k"
    done
  else
    for k in '## 📋 Business Visual Prompt' '### Prompt to send' '### Why this structure' '**Template:**' '**Target:**'; do
      grep -qF -- "$k" "$f" || bad "$f missing: $k"
    done
    grep -q 'Research context (unverified unless sourced):' "$f" || bad "$f missing Research context"
    grep -qE '^- Pattern \(unverified\):|^- Benchmark \(' "$f" || bad "$f research lines lack a Pattern or Benchmark label"
  fi
  n="$(grep -c '^```text' "$f")"; [ "$n" -eq 1 ] || bad "$f must contain exactly one prompt code block (found $n)"
  grep -qE '^\*\*Level' "$f" && bad "$f shows the internal level in the delivered output"
  if grep -q '^### Assumptions to verify before copying' "$f"; then
    a="$(grep -n '^### Assumptions to verify before copying' "$f" | head -1 | cut -d: -f1)"
    p="$(grep -nE '^### (Prompt to send|Revised prompt)' "$f" | head -1 | cut -d: -f1)"
    [ "$a" -lt "$p" ] || bad "$f puts the assumptions after the prompt"
    grep -q 'Assumptions to verify (not confirmed):' "$f" || bad "$f lists assumptions outside the prompt but not inside it"
  fi
done
ok "examples follow the delivered output format"

# 9. Output format, SKILL.md and references carry the key rules
for k in 'No invented figures' 'Assumptions to verify before copying' 'Assumptions to verify (not confirmed):' '**Choice fields.**' '## Language' '## Thin prompt' '## Redaction' '## Multiple prompts' '## Repair delivery' 'Before → Fix → After'; do
  grep -qF -- "$k" assets/output-format.md || bad "output-format lacks: $k"
done
grep -q '^\*\*Template:\*\*' assets/output-format.md || bad "output-format snapshot lacks the Template line"
grep -q 'Level / Template' assets/output-format.md SKILL.md references/*.md README.md && bad "stale 'Level / Template' snapshot field still referenced"
grep -q 'at most 4 questions' SKILL.md || bad "SKILL.md lacks the 4-question batch rule"
grep -qi 'one batch, at most 4 questions' references/question-bank.md || bad "question-bank lacks the batch rule"
grep -q '^## Priority order by template' references/question-bank.md || bad "question-bank lacks the priority order"
for t in 'T1 Basic' 'T2 Operational' 'T3 Strategic' 'T4 Financial' 'T5 Marketing' 'T6 People' 'T7 Legal' 'T8 Complex' 'T9 Crisis' 'T10 Growth'; do
  grep -qF "| $t |" references/question-bank.md || bad "question-bank priority order missing: $t"
done
grep -qi 'combined' references/question-bank.md || bad "question-bank lacks combined questions"
grep -q 'Interaction test' references/research-guide.md || bad "research guide lacks the interaction test"
grep -q '^## 2. Query hygiene' references/research-guide.md || bad "research guide lacks query hygiene"
grep -q 'Repo documents' SKILL.md && bad "SKILL.md must not explain repository documents (README owns that)"
grep -q '^## Pre-delivery self-check' SKILL.md || bad "SKILL.md lacks the pre-delivery self-check"
grep -q '^## Repair mode' SKILL.md || bad "SKILL.md lacks Repair mode"
grep -qi 'provisional' SKILL.md || bad "SKILL.md lacks the provisional template step"
ok "key rules present in SKILL.md, output-format, question-bank and research-guide"

exit $fail
