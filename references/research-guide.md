# Research Guide

Governs Phase 2: how deep to search, how to keep queries safe, what to keep, how research enters the prompt, how to analyze and classify the problem, and how to pick a template.

## 1. Why research runs, and how deep

Online research runs on every request when a search tool is available, including simple ones. A problem that looks basic often has industry context or common failure patterns that change how the prompt should be built. Depth scales with the request:

| Situation | Depth |
|---|---|
| Normal | 2 to 4 targeted queries |
| Simple, single, clear problem | 1 to 2 focused queries |
| User is rushing ("quick", "just do it", "no questions") | One query on the single most relevant path; stop there |

A light path is still research: the same filter and provenance rules apply. Never fabricate a source, and never treat an unverified result as a sourced figure.

**No search tool:** say so once in plain words, omit the Research context block from the prompt, and continue. Do not write research from memory and do not describe memory as research.

## 2. Query hygiene

A search query leaves the conversation, so it carries only what a stranger could safely read.

- Never put private client names, personal names, email addresses, account or invoice identifiers, or any confidential identifier in a query.
- Avoid exact internal financial figures. Search the situation, not the numbers.
- Generalize business names and identifying details. Use industry, business type, problem category and market context instead.
- Use a public company or brand name only when the user explicitly asks to research that entity and the name is genuinely needed.
- Apply this whether or not the user authorized redaction in the prompt. Redaction of the prompt and hygiene of the query are separate.

## 3. Build the queries

Build the queries from what the user said, after applying section 2. Use the current year from the environment date wherever a year helps; never type a fixed year from an example.

Query shapes:
- `[problem type] [industry] {year}`
- `[problem type] case study OR best practice`
- `[specific symptom] business how to fix`
- `[business type] [domain] common mistakes OR root causes`

Examples (replace `{year}` with the current year):
- `cash flow problem small business solution {year}`
- `employee retention service business best practices`
- `SaaS churn increase root causes`
- `restaurant foot traffic decline marketing`

## 4. Filter

Keep only results that are:
- Directly relevant to the user's problem and business type
- From credible sources (publications, industry reports, case studies, official sites)
- Recent enough for the domain (prefer the last 2 to 3 years for fast-moving topics)
- Actionable: real strategies, data or frameworks, not definitions

Discard generic listicles, unrelated industries, outdated figures, and anything that contradicts business fundamentals without strong evidence.

## 5. Provenance rules

Every research line that enters the prompt is one of two kinds.

| Kind | Rule | Example shape |
|---|---|---|
| **Sourced figure** | Must carry the source name, the publication or data date from the result, and the business type it applies to. If any of the three is missing, convert it to a Pattern or drop it. | `Benchmark (SaaS, [Source], [date]): ...` |
| **Pattern** | A qualitative finding with no number. Label it. | `Pattern (unverified): ...` |

Additional rules:
- Never state a figure from memory.
- Never present research as something the user said, and never present an assistant-made assumption as something the user said. Research goes only under *Research context*; assumptions only under *Assumptions to verify (not confirmed)*.
- Volatile facts (rates, thresholds, deadlines, caps, multiples, regulatory status) are not included from research unless sourced and dated. The advisor verifies them itself.
- Do not include a link list. State the source by name in the line.

## 6. Analyze

Combine the user's facts with the filtered findings and identify:
- The **scope** of the problem
- The **domains** involved
- The **urgency**, including whether a hard clock exists
- The **relationships between problems**, when there is more than one (see the interaction test below)

Do not invent a root-cause theory to complete this step. The advisor tests causes; the prompt does not assert them.

When the user states their own suspicion, keep it as a clearly labeled **user hypothesis** (in the prompt: *My own suspicion (my hypothesis, not verified)*; in T8 and T9: the suspected-links field). Never turn it into a conclusion and never attribute an assistant-made guess to the user.

## 7. Classify the level (internal) and pick the template

The level is an internal routing aid. It is never shown to the user. The levels match the advisors' own tiers, so the prompt arrives in a shape they can route.

| Level | Meaning | Advisor tier |
|---|---|---|
| **Basic** | One clear problem; a single pass or a fill-in document answers it | business-advisor v1 |
| **Moderate** | One problem that needs a root-cause diagnosis, several rounds of real questions, or a decision with genuine trade-offs | v2 |
| **Complex** | Several problems that depend on each other | v3 |

**Interaction test (decides Complex):** if the answer to one part would change the question or decision for another part, the problems interact and the level is Complex. If not, they are independent and each is its own prompt.

**What does not raise the level on its own:** seriousness, high stakes, urgency, or the length of the message. A deep single problem is Moderate however hard it is.

**Hard clock:** a dated deadline or a runway measured in days or weeks, not months. A hard clock selects T9, which carries its own level (Moderate for one problem, Complex when the interaction test passes).

### Template selection map

The first pick is provisional (Phase 1, step 3) and is confirmed or changed here, after the answers.

| Situation | Template |
|---|---|
| General, unclear or still-vague single problem | T1 |
| Process or workflow breakdown | T2 |
| Choosing a strategic direction, pivot or major decision | T3 |
| Cash, pricing, profitability or funding | T4 |
| Branding, marketing, leads or conversion | T5 |
| Team, hiring, culture or workplace conflict | T6 |
| Legal, contractual or compliance matters | T7 |
| Multiple genuinely interdependent problems (no hard clock) | T8 |
| A business problem with a hard deadline or short runway | T9 |
| Scaling, expansion or entering a new market | T10 |

| Typical internal level | Templates |
|---|---|
| Basic | T1 |
| Basic or Moderate | T2, T4, T5, T6, T7 |
| Moderate | T3, T10, T9 with one problem |
| Complex | T8, T9 when problems interact |

### Boundaries

- **T3 vs T10.** T3 is about *which direction*: a pivot away from what works now, a change of model or positioning, a major either-or decision that is not about expansion. T10 is about *growing what works*: scaling, expansion, a new location or market, a bigger team, launching an extension of the current offer. Whether to do the growth move now is still T10. A pivot into a new market, away from the current business, is T3.
- **T1 is a fallback.** Use T1 when no domain template clearly fits, or when the facts are too thin to choose. T1 never overrides a clearly appropriate domain template, and a vague message that names a domain ("my sales are down") already points to that domain.
- **Several problems.** Several problems that pass the interaction test and have no hard clock are T8. Several problems that fail the test get one prompt each, starting with the user's priority. When several independent problems are named and no priority is given, ask for the priority in the gap batch.
- **Hard clock.** One problem under a hard clock is T9 (Moderate). Several interacting problems under a hard clock are T9, filling its "other problems in play" field (Complex).

Tie-breaks:
- Between two templates, choose the one matching the **primary domain**.
- Never default to T8 or T9 because a problem feels serious.
- Between Basic and Moderate, choose the domain template and let the advisor decide depth.

## 8. What enters the prompt

- Research appears only under *Research context* in the prompt, one short line per finding, each following the provenance rules above.
- If nothing passes the filter, omit the block. An empty or padded block is worse than none.
- The user's own words and facts stay in *In my words* and *Known*; research never overwrites them.
- A user hypothesis stays labeled as the user's; an assumption stays under *Assumptions to verify (not confirmed)*.
