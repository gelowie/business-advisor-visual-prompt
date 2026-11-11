---
name: business-advisor-visual-prompt
description: Builds or repairs a copy-paste-ready prompt for a business problem, to send to business-advisor-pro (or business-advisor). Use when the user asks to write, fix, rephrase, clean up or structure a business prompt, wants to send a problem to the business advisor but cannot explain it well, pastes messy notes to turn into a prompt, or pastes an existing prompt to improve. It asks only for missing facts, adds sourced research context, labels assumptions, can redact private details, and delivers one prompt per independent problem. It does not solve the problem; a plain request for business advice goes to business-advisor-pro directly.
---

# Business Advisor Visual Prompt

A **prompt builder and repairer** for business problems. It rebuilds rough notes, a vague description or an existing prompt into a structured prompt that business-advisor-pro (or business-advisor) can work from without asking the user to repeat themselves.

It does **not** solve the business problem. If the user simply wants advice, hand the problem to business-advisor-pro; do not run this flow.

## Choose the mode

| The user gives | Mode |
|---|---|
| Rough notes, a vague description, messy text | **Build** (three phases below) |
| An existing prompt and asks to improve, fix or rephrase it | **Repair** (below) |

If unclear, treat a pasted prompt as Repair.

## Build mode — three phases

Phase 1 is satisfied by *facts*, not by questions: if the user already gave what is needed, nothing is asked.

### Phase 1 — Intake

Purpose: know what the user said, what is missing, and which template the missing facts should serve.

1. **Understand the problem.** Read the message and keep the user's exact words for *In my words*.
2. **Take inventory.** Sort what the user gave into **Known** and **Not known** using the checklist in `references/question-bank.md`.
3. **Pick a provisional template.** Use the map in `references/research-guide.md` (section 7). The pick is provisional. If the facts are too thin to choose, use T1 and do not force a fit.
4. **Find the gaps that matter for that template.** Use that template's priority order in `references/question-bank.md`.
5. **Ask once.** One batch, at most 4 questions, highest priority first. Related figures may be one combined question. Never re-ask something already answered. **Fast path:** if the essentials are present, ask nothing; state in one line what you are assuming and continue.
6. **Accept any answer.** A partial answer, "I don't know" and "just do it" are all valid. Record the item as *Not provided*, accept a labeled range if offered, continue, never press and never invent a figure.
7. **Finalize the template** from the answers. It may change (for example, an answer reveals a hard clock). A second batch is allowed only when an answer reveals a different problem type or contradicts an earlier fact.
8. **Align to the target.** Map the business to one of the four types the advisors use, and capture jurisdiction whenever law, tax, employment, privacy or fundraising is involved (`references/target-map.md`).

### Phase 2 — Research and analysis

Purpose: add context that is real, relevant, traceable and safe to search for.

1. **With a search tool**, choose the depth (normal, simple, rushing) and write privacy-safe queries. Depth, query hygiene, filtering and provenance are in `references/research-guide.md`. Research is not skipped, but it can be light.
2. **Without a search tool**, say so once, omit the Research context block, and continue. Never write research from memory.
3. **Analyze** scope, domains, urgency and relevant links between problems. Do not invent a root-cause theory. A suspicion the user stated is kept as a labeled user hypothesis.
4. **Classify the level internally** with the interaction test and confirm the template (`references/research-guide.md`, sections 6 and 7). The level is never shown to the user.

### Phase 3 — Build and deliver

1. Fill the chosen template from `assets/prompt-templates/` using only user facts, labeled assumptions, labeled research context and the outcome wanted.
2. Run the pre-delivery self-check below.
3. Deliver in the format defined in `assets/output-format.md`: snapshot, assumptions to verify (when any), a thin-prompt warning (when it applies), the prompt alone in its own code block, and a 2–4 sentence "Why this structure". Independent problems each get their own prompt.
4. If the business-advisor-pro skill is available in this session, end with one line offering to run the prompt through it now.

## Repair mode

For an existing prompt the user wants improved. Do not run the full three-phase intake when the prompt already holds what is needed.

1. Understand the original purpose and constraints.
2. Find what is unclear, contradictory, redundant or missing.
3. Keep the original objective, wording where it is clear, and every stated constraint.
4. Improve wording, structure, clarity and completeness. If the prompt is already good, say so and change only what helps.
5. Never add a business fact. A contradiction the user must settle is listed under *Not provided yet* with both versions, not resolved silently. A missing fact is listed, not guessed.
6. Deliver as **Before → Fix → After** plus the complete revised prompt in its own code block (`assets/output-format.md`, Repair delivery).

## Pre-delivery self-check

Run silently before delivering any prompt. Show it only if the user asks. Fix any failure before delivering.

1. No unfilled template bracket remains (intentional redaction markers are allowed).
2. No figure or fact the user did not give appears as a fact, including choice fields such as who is involved, who already knows, or the main symptom.
3. The user's facts are preserved accurately.
4. Assumptions are labeled and none sits under *Known*.
5. Research is sourced (source, date, business type) or labeled as an unverified pattern.
6. Missing information is listed under *Not provided yet*.
7. The template matches the problem.
8. The outcome matches what the user wants.
9. Nothing is repeated, and the prompt body appears once.
10. The prompt reads clearly and is ready to copy.

## Templates

Selection logic and boundaries live in `references/research-guide.md`. Each template file adapts the same prompt skeleton to a problem type.

| Template | File | Use when |
|---|---|---|
| T1 | `assets/prompt-templates/T1-basic.md` | One problem that is general, unclear or still vague (fallback, never overrides a clear domain template) |
| T2 | `assets/prompt-templates/T2-operational.md` | Process or workflow breakdown |
| T3 | `assets/prompt-templates/T3-strategic.md` | Choosing a strategic direction, pivot or major decision |
| T4 | `assets/prompt-templates/T4-financial.md` | Cash, pricing, funding, cost, profitability |
| T5 | `assets/prompt-templates/T5-marketing.md` | Brand, leads, audience, content, conversion |
| T6 | `assets/prompt-templates/T6-people.md` | Team, hiring, culture, conflict |
| T7 | `assets/prompt-templates/T7-legal-compliance.md` | Contract, IP, regulation, dispute |
| T8 | `assets/prompt-templates/T8-complex-multi.md` | Several problems that depend on each other |
| T9 | `assets/prompt-templates/T9-crisis.md` | A hard clock of days or weeks threatens the business |
| T10 | `assets/prompt-templates/T10-growth.md` | Scaling, expansion, a new market |

Worked examples for T1, T4, T7, T8 and T9, plus one repair: `assets/examples/example-basic.md`, `assets/examples/example-financial.md`, `assets/examples/example-legal.md`, `assets/examples/example-complex.md`, `assets/examples/example-crisis.md`, `assets/examples/example-repair.md`.

## Target

| Target | When | Notes |
|---|---|---|
| business-advisor-pro | Default | Uses the four business types, a jurisdiction layer and a precision gate (ask once, never invent figures, labeled ranges) |
| business-advisor | The user names it | Same prompt body; only the destination name changes |

Field-by-field detail: `references/target-map.md`.

## Rules

- **Facts keep their origin.** Every line in the prompt is one of: the user's own words, a Known fact, Not provided, an Assumption, a user hypothesis, or Research context. A figure the user did not give never appears as a Known fact, and an assumption never appears as one.
- **The prompt states the outcome, not the answer's shape.** No persona line, no numbered "what I need" list, no fixed step counts, no summary paragraph. The advisor chooses its own method and depth.
- **One problem, one prompt.** If several problems fail the interaction test, build separate prompts, each in its own code block, starting with the one the user names as the priority. Never merge independent problems into one prompt.
- **Suspected links are hypotheses.** Write them as "I think A feeds B because…", never as conclusions. Never attribute an assistant-made assumption to the user.
- **No unfilled brackets.** A field with no user data is removed and listed under *Not provided yet*.
- **Language follows the user.** The prompt uses the user's primary language. *In my words* stays verbatim in the original language and wording.
- **Redaction is optional and authorized.** Offer it when private details are present or when asked. Never change the user's text silently, and keep private details out of search queries.
- **Language is plain and direct.** No filler, no vague phrases.
- **Saving the prompt as a file** (Word, PDF, text) defers to the environment's own file skills. The prompt text does not change.
