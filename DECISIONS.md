# Decisions

Why each rule exists.

## Decision 1 — Intake collects gaps, not a fixed question list

**Decision:** The skill keeps a checklist of what to *know*, classifies the problem provisionally, and asks only for the missing facts that template needs, in one batch of at most four questions, essentials first. Related figures may share one question, business type and industry may join the first question, and each template has its own priority order. A second batch is allowed only when an answer reveals a different problem type or contradicts an earlier fact. A partial answer, "I don't know" and "just do it" are always accepted. The template is finalized after the answers.
**Why:** The advisor asks once, in one batch of about four essentials. Questions that fit the problem avoid re-asking and drip-feeding, and a user who gave everything is asked nothing.

## Decision 2 — "Not provided" replaces filling every field

**Decision:** A missing item is listed under *Not provided yet*, optionally as a range marked "my estimate". A figure appears under *Known* only if the user gave it. A template field that picks from a list is filled only when the user's words settle the choice. Brackets never remain in the delivered prompt.
**Why:** The advisor never computes on guesses. It can tell a real number from a blank and can ask or use labeled ranges.

## Decision 3 — Assumptions are visible, separate and never facts

**Decision:** Material assumptions appear before the prompt as "Assumptions to verify before copying" and inside it as "Assumptions to verify (not confirmed):". They never appear under *Known*, in *In my words* or in a user hypothesis. None are invented to look complete. A suspicion the user stated is a labeled user hypothesis, and an assumption is never attributed to the user.
**Why:** The user can check the guesses before sending, and the advisor can tell what is established.

## Decision 4 — Research carries provenance

**Decision:** Research lines are either a sourced figure (source, date, business type) or a labeled pattern with no number. Without a search tool, the research block is omitted. Queries use the current year, never a typed one.
**Why:** The advisor labels claims Computed, Benchmark, Judgment or Unverified and verifies volatile facts itself, so stale or invented statistics must not travel as facts.

## Decision 5 — Research queries are written as if a stranger will read them

**Decision:** Queries use industry, business type, problem category and market context, never private names, emails, account details or exact internal figures. A public name is used only when the user asks to research that entity. Depth scales: normal, simple (fewer queries) and rushing (one path). Hygiene applies whether or not redaction was requested.
**Why:** A search query leaves the conversation. Research stays useful without disclosing confidential details, and a rushed user is not slowed down.

## Decision 6 — The prompt states the outcome, not the answer's shape

**Decision:** No persona line, no numbered lists, no fixed counts and no summary. Each template ends with one *Outcome I want*. T8 and T9 write suspected links as hypotheses.
**Why:** The advisor chooses lane, depth and method itself and tests interdependence itself.

## Decision 7 — Intake fields match what the advisor needs

**Decision:** Business type uses the advisor's four types. A type the user's words plainly settle is mapped directly; a type they leave open is an assumption. Jurisdiction is captured wherever law, tax, employment, privacy or fundraising is involved (T4, T6, T7, T8, T9, T10) and is always required in T7. T4 collects currency and basis, cash balance, revenue, expenses, burn, payment terms, debt and what changed.
**Why:** Fewer round trips and no silent US default.

## Decision 8 — Narrow trigger, fast path, no-search fallback

**Decision:** The skill triggers only when the user wants a prompt written, fixed or structured. Plain advice requests go to the advisor. Phase 1 is satisfied by facts, so a complete message is not questioned. Without search, research is omitted and the user is told once.
**Why:** The skill runs only when someone wants a prompt, and does not overlap the advisor's own triggers.

## Decision 9 — The level follows interdependence and stays internal

**Decision:** Basic, Moderate and Complex match the advisor's v1, v2 and v3 and are used for routing only; the delivered snapshot shows the template, never the level. The interaction test decides Complex: if the answer to one part would change the question or decision for another, the problems interact. Seriousness and urgency alone do not raise the level. A hard clock (days or weeks) selects T9, whose level is Moderate for one problem and Complex when problems interact. Independent problems get one prompt each.
**Why:** Prompts arrive in a shape the advisor can route without overriding it, and the user is not asked to argue with a label.

## Decision 10 — The handoff preserves the user's words and facts

**Decision:** Every prompt has *In my words* (verbatim, in the original language and wording), *Known (please don't re-ask)* and *Not provided yet*.
**Why:** The advisor's routing carries the user's objective in their own words and does not re-ask, so the user never repeats themselves.

## Decision 11 — One delivered shape, one copy block

**Decision:** Deliver a short snapshot, assumptions to verify (when any), a thin-prompt warning (when it applies), the prompt alone in its own code block, and a short "Why this structure". Decorative box lines are replaced by plain markdown. `assets/output-format.md` is the single owner of the format, and each template keeps only a one-line rationale cue.
**Why:** The copy button copies exactly the prompt, and nothing is stated twice.

## Decision 12 — Repair mode is separate from raw intake

**Decision:** A pasted prompt goes through Repair mode, not the three phases. It keeps the original objective, constraints and clear wording, never adds a business fact, lists contradictions with both versions instead of resolving them, keeps the user's own format requests under a labeled section, and does not rebuild a prompt that already works. The result is a concise Before → Fix → After plus the complete revised prompt in its own code block.
**Why:** Improving a prompt should not turn into an interview, and nothing the user wrote is silently dropped.

## Decision 13 — Several prompts, thin prompts, redaction and language

**Decision:** Independent problems each get their own prompt under one heading and one target line, the user's priority first; up to three are delivered together, more than that as the priority prompt plus an offer to continue. A prompt with at least half of the template's top inputs missing is still built, with one short warning naming the one or two most useful facts. Redaction (Person A, Client A, Company A, [REDACTED EMAIL], [REDACTED IDENTIFIER]) is offered, applied only when authorized, labeled in the snapshot and in a prompt note, and applied to *In my words* only to the private details. The prompt follows the user's primary language.
**Why:** The format covers real usage without forcing complexity on simple requests.

## Decision 14 — Template boundaries

**Decision:** The ten templates are separate files with an explicit selection map. T1 is a fallback and never overrides a clearly appropriate domain template. T3 covers strategic direction (a pivot, a change of model, a major either-or decision); T10 covers growing what works (scaling, expansion, a new market). Between two templates, the primary domain decides.
**Why:** Clear boundaries keep prompts in the right shape and stop serious or urgent problems from defaulting to the multi-problem or crisis templates.

## Decision 15 — Target switch; the advisor repositories are not edited

**Decision:** The default target is business-advisor-pro; business-advisor is accepted when named, with the same prompt body. This skill does not edit, extend or depend on either advisor.
**Why:** No hidden coupling and no changes to repositories this skill does not own.

## Decision 16 — Repo layout mirrors the advisors

**Decision:** Content lives under `assets/` and `references/` like the advisors, with `README.md`, `CHANGELOG.md`, `DECISIONS.md`, `TESTS.md` and `scripts/` holding static checks. The scripts check only what can make the repository untrue (required files, references, content rules, README badges). The README is the only file that carries badges. There is no `tools/` folder, because the skill produces text only.
**Why:** The repository can be audited the same way as business-advisor.
