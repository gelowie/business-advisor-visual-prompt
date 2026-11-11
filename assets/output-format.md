# Output Format

The single owner of how Phase 3 and Repair mode are delivered. Templates supply the content fields; this file supplies the shape.

## Delivered response (Build mode, one prompt)

Parts in this order. The prompt body appears **once**, inside the code block, and nowhere else. Omit any part marked "when" if it does not apply.

````markdown
## 📋 Business Visual Prompt

**Topic:** [one-line business topic]
**Problem:** [one or two sentences, no fluff]
**Task:** [what the advisor is being asked to produce or decide]
**Template:** [T# Name]
**Target:** [business-advisor-pro | business-advisor]
**Redaction:** [applied: what was replaced]   (only when redaction was applied)

### Assumptions to verify before copying

- [assumption that materially affects the prompt, and why it matters]   (omit this whole section when there are none)

> This prompt is usable, but it has limited business context. The most useful details to add would be [one or two facts].   (only for a thin prompt)

### Prompt to send

```text
[prompt body, built from the chosen template]
```

### Why this structure

[2 to 4 sentences: why this template, what it asks the advisor to focus on, and anything assumed.]
````

After these parts, if business-advisor-pro is available in the session, add one line offering to run the prompt through it. If you offered redaction (see below), the offer is one line before the code block.

The snapshot shows the template, never the internal level (Basic, Moderate or Complex).

## Prompt body

Sections appear in this order. Omit a section when it has no content; never fill it with filler.

```text
In my words:
"[the user's own statement of the problem, lightly trimmed, never rewritten]"

Redaction note:
[names and identifiers below are replaced: Person A, Client A, Company A, [REDACTED EMAIL], [REDACTED IDENTIFIER]]   (only when redaction was applied)

Business:
- Type: [service-based | digital product/SaaS | physical product/e-commerce | local brick-and-mortar]
- Industry: [...]
- Stage: [...]
- Jurisdiction: [country, state or province]   (only when law, tax, employment, privacy or fundraising is involved)

Known (please don't re-ask):
- [fact the user gave, with figures exactly as given]

My own suspicion (my hypothesis, not verified):
- [only when the user stated a suspicion and the template has no suspected-links field]

[template-specific section]

Not provided yet:
- [item the user did not give; ranges welcome, marked "my estimate"]

Assumptions to verify (not confirmed):
- [assumption the advisor must treat as unconfirmed]

Research context (unverified unless sourced):
- [Benchmark (business type, source, date): ...]
- [Pattern (unverified): ...]

Constraints:
- [budget, timeline, resources; ranges are fine]

Outcome I want:
[what to decide or produce, as stated in the template]
```

## Rules

1. **Origin is explicit.** Each line is the user's words, a Known fact, Not provided, an Assumption, a user hypothesis, or Research context. Nothing else.
2. **No invented figures.** A number appears under *Known* only if the user gave it. A missing figure goes under *Not provided yet*. A user estimate is written as a range or marked "my estimate".
   **Choice fields.** A template field that picks from a list (who is involved, who already knows, the main symptom, the status) is filled only when the user's words settle the choice. Otherwise the field is removed and, if it matters, listed under *Not provided yet*.
3. **Assumptions are separate.** An assumption never appears under *Known*, in *In my words* or in a user hypothesis. List only assumptions that materially change the prompt (for example, a business type read from the industry, a stage, a currency). Do not invent assumptions to make the output look complete. With none, omit both the response section and the prompt section. The same assumptions appear in both places: before the prompt so the user can check them, and inside the prompt so the advisor treats them as unconfirmed.
4. **No persona line, no numbered "what I need" list, no fixed step counts, no summary paragraph.** The prompt states the outcome; the advisor chooses method and depth.
5. **Research follows the provenance rules** in `references/research-guide.md`: a sourced figure carries source, date and business type; a pattern carries no number.
6. **Empty fields are removed.** A template field with no user data is deleted from its section and, if it matters, listed under *Not provided yet*. No template bracket may remain in the delivered prompt. Intentional redaction markers are not template brackets.
7. **Length follows the facts.** Short facts make a short prompt.
8. **Nothing from the prompt body is repeated outside the code block.** The snapshot is a label, not a second copy. The assumptions list and the thin-prompt warning are notes for the user, not a second copy of the prompt.
9. **Plain language.** Direct sentences, no filler.

## Language

The prompt is written in the user's primary language: English input gives an English prompt, Filipino input a Filipino prompt, and Taglish input natural Taglish where that reads best. Technical terms, proper nouns and business terms stay understandable and are kept as the user wrote them.

*In my words* is the exception to adaptation: it keeps the user's original wording, language, expressions and code-switching. Do not translate, rewrite or correct it. The labels of the prompt sections (*Known*, *Outcome I want*, and so on) may follow the user's language; keep them recognizable.

## Thin prompt

A prompt is thin when at least half of the template's top-priority inputs (`references/question-bank.md`) are *Not provided*. Never refuse or stall. Build the prompt, then add one short warning before it, naming only the one or two most valuable missing facts for that template. Do not ask for them again; the user may supply them or not.

## Redaction

Redaction replaces private details with neutral markers before the prompt is shared: personal names with `Person A`, `Person B`; client names with `Client A`; company names with `Company A`; email addresses with `[REDACTED EMAIL]`; account, invoice or other identifiers with `[REDACTED IDENTIFIER]`.

- **Offer, do not impose.** When the user's message contains such details, add one line offering to redact them, or redact when the user asks. Until the user agrees, the prompt keeps their text as written.
- **Apply when authorized.** Use the same marker for the same person or entity throughout. Keep the rest of the user's wording as it was. In *In my words* only the private details are replaced.
- **Make it visible.** State the redaction in the snapshot and add the *Redaction note* section to the prompt, so the advisor knows the markers are intentional.
- **Queries stay clean regardless.** Search queries follow `references/research-guide.md` section 2 even when redaction was not requested.

## Multiple prompts

Independent problems (those that fail the interaction test) each get their own prompt.

- Open with the heading `## 📋 Business Visual Prompts`, one line saying the problems are independent and why they are separate, and a single `**Target:**` line (not repeated per prompt).
- Label each prompt `### Prompt 1 of N — [short label] (T# Name)`, followed by its own `#### Assumptions to verify before copying` list (when any) and its own code block. Put the user's priority first.
- Use one shared *Why this structure* at the end (2 to 4 sentences covering all prompts).
- **Deliver all together** when there are three prompts or fewer and the response stays manageable. **Otherwise** deliver the highest-priority prompt in full, list the rest by label, and offer to continue with them.
- Never combine independent problems into one prompt for convenience.

## Repair delivery

For an existing prompt the user wants improved. No snapshot of Topic, Problem and Task is needed.

````markdown
## 🔧 Prompt repair

**Original purpose:** [one sentence]

### Before → Fix → After

- **Before:** [what the original did or lacked, quoted briefly]
  **Fix:** [what changed and why]
  **After:** [how it reads or behaves now]
- [one block per meaningful change; keep it concise]

### Assumptions to verify before copying

- [only when the repair needed one]

### Revised prompt

```text
[the complete revised prompt]
```
````

Repair rules:
- Keep the user's original objective, constraints and clear wording. If the original is already good, say so and change only what helps.
- Never add a business fact. A contradiction the user must settle is listed under *Not provided yet* with both versions. A missing fact is listed, not guessed.
- Adopt the shared sections of the prompt body only where the original lacks structure. Do not rebuild a prompt that already works.
- The user's own explicit instructions about how to answer (a persona, a number of steps, a summary) are kept, moved under *My format requests (from my original prompt)*, and the Fix notes that the advisor chooses its own method so the user may delete them. Do not remove them silently and do not add new ones.
- The revised prompt appears once, alone in its own code block. The language rule and the redaction rules above apply.
