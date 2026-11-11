# Target Map

What each target does with the prompt this skill produces, and which prompt fields exist because of it. Verified against the target skills' own files.

## business-advisor-pro (default)

| Prompt field | Why it exists | Where the target uses it |
|---|---|---|
| Business type (one of four) | The target adapts advice to service-based, digital product/SaaS, physical product/e-commerce or local brick-and-mortar. Free text forces it to ask or guess. | business-advisor-pro SKILL.md Step 1; `business-advisor-pro/references/business-types.md` |
| Jurisdiction | Legal, tax, employment, privacy and fundraising answers depend on it. The target assumes the US if it is silent, so a missing value can silently mislead. | `business-advisor-pro/references/jurisdiction.md` |
| Currency, period, basis (T4, T10) | Figures must share one currency, period and basis (cash or accrual) or the integrity checks fail. | `business-advisor-pro/assets/precision-gate.md` §2 |
| Essential inputs (cash balance, net burn, payment terms) | Without them the target must stop and ask. Supplying them removes the round trip. | `business-advisor-pro/assets/precision-gate.md` §1 |
| Not provided yet | The target never computes on guesses; it uses labeled ranges and says which figure to gather. | `business-advisor-pro/assets/precision-gate.md` §1 |
| In my words | The target's routing carries the user's stated objective in their own words. | `business-advisor-pro/assets/routing.md`, "Information that travels with the request" |
| Known (please don't re-ask) | Established facts are passed along as given and not re-asked. | `business-advisor-pro/assets/routing.md`; `business-advisor-pro/assets/templates3/v3-pipeline.md`, Stage 0 |
| Research context, labeled | The target labels claims Computed, Benchmark, Judgment or Unverified and verifies volatile facts itself. Unsourced figures arriving as facts conflict with that. | `business-advisor-pro/assets/precision-gate.md` §4 and §5 |
| Outcome, not answer shape | The target decides lane, depth and method itself (fast lane, v1, v2, v3). A prescribed answer structure fights that choice. | business-advisor-pro SKILL.md Step 0; `business-advisor-pro/assets/routing.md` |
| Suspected links as hypotheses (T8, T9) | The target tests interdependence itself. A stated verdict pre-judges the routing. | `business-advisor-pro/assets/routing.md`, Rule 3 |
| Assumptions to verify (not confirmed) | The target keeps an assumption ledger and does not treat a guess as an input. Assumptions arrive labeled so they enter that ledger instead of the Known facts. | `business-advisor-pro/assets/precision-gate.md` §3 |
| My own suspicion (user hypothesis) | A cause the user suspects is passed as theirs, to be tested, not as a finding. Same reason as suspected links. | `business-advisor-pro/assets/routing.md`, Rule 3 |
| Redaction note | Markers such as Person A or [REDACTED EMAIL] are intentional. The note stops the target from asking for the real names or treating the markers as missing data. | n/a (explanatory) |
| My format requests (repair mode only) | The user's own instructions about how to answer (a persona, a step count) are kept visible and separate from the facts. The target still chooses its own method and the user may delete them. | business-advisor-pro SKILL.md Step 0 |

## business-advisor

The same prompt body is used; only the destination name changes. The base skill has the four business types, eight domains and v1/v2/v3 routing, but no jurisdiction layer and no precision gate. Jurisdiction, essential numbers and *Not provided* lines still go in the prompt; the base skill treats them as ordinary context.

## What this skill does not do to the targets

It does not edit, extend or depend on either target. The targets do not need to know this skill exists.
