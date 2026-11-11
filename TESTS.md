# Tests

[Back to README](README.md)

Three kinds of tests: static checks (scripts), check sensitivity (mutations of a throwaway copy) and behavioral tests (the skill executed on realistic inputs).

Status values: PASS, FAIL, Not Run.

## Static checks (run)

Run all with `scripts/verify-all.sh`.

| ID | Check | Script | Expected | Actual | Status |
|---|---|---|---|---|---|
| S01 | Required files, frontmatter hygiene, template and example inventory, LICENSE naming and holder, line endings, executable scripts | `scripts/verify-structure.sh` | No FAIL lines | No FAIL lines (17 checks) | PASS |
| S02 | Every path reference resolves; every `.md` and `.sh` file reachable from `SKILL.md` or `README.md` | `scripts/verify-links.sh` | No FAIL lines | No FAIL lines (2 checks) | PASS |
| S03 | Template skeleton with assumptions block and rationale cue, T1/T3/T10 boundaries, removed patterns absent, jurisdiction fields, T4 inputs, T8/T9 rules, no hardcoded years, no unsourced statistics, example format (build and repair), assumptions placed before the prompt, no displayed level, key rules present in output-format, SKILL.md, question-bank and research-guide | `scripts/verify-templates.sh` | No FAIL lines | No FAIL lines (12 checks) | PASS |
| S04 | External skill-format validator (frontmatter name and description) | external | "Skill is valid" | "Skill is valid!" | PASS |
| S05 | README badges match the repo (version, license, template count, full set); no other file carries badges | `scripts/verify-badges.sh` | No FAIL lines | No FAIL lines (7 checks) | PASS |

### Check sensitivity (do the scripts fail when they should?)

Each mutation was applied to a throwaway copy and `scripts/verify-all.sh` was rerun.

| ID | Mutation | Expected | Actual | Status |
|---|---|---|---|---|
| M01 | Persona line added to T1 | FAIL | FAIL: assets/prompt-templates/T1-basic.md contains a removed pattern (persona, Step by Ste | PASS |
| M02 | Hardcoded year added to research guide | FAIL | FAIL: hardcoded year found: | PASS |
| M03 | Reference to a missing file added to SKILL.md | FAIL | FAIL: broken reference in SKILL.md -> references/missing-file.md | PASS |
| M04 | Orphan file added under references/ | FAIL | FAIL: unreachable file: references/orphan.md | PASS |
| M05 | Unsourced percent figure added to an example | FAIL | FAIL: unsourced percent in examples: | PASS |
| M06 | LICENSE.txt re-added | FAIL | FAIL: LICENSE.txt present; use LICENSE | PASS |
| M07 | CRLF line endings in a template | FAIL | FAIL: CRLF found in: ./assets/prompt-templates/T2-operational.md | PASS |
| M08 | Cash balance field removed from T4 | FAIL | FAIL: T4 missing: Cash balance now | PASS |
| M09 | Version badge set to a different version than the CHANGELOG | FAIL | FAIL: README version badge is '9.9.9', CHANGELOG says '0.4.1' | PASS |
| M10 | Template badge count changed to 12 | FAIL | FAIL: templates badge '12' but 10 template files | PASS |
| M11 | A badge added to SKILL.md | FAIL | FAIL: badges found outside README.md: ./SKILL.md | PASS |
| M12 | A badge added to CHANGELOG.md | FAIL | FAIL: badges found outside README.md: ./CHANGELOG.md | PASS |
| M13 | A badge added to TESTS.md | FAIL | FAIL: badges found outside README.md: ./TESTS.md | PASS |
| M14 | License badge changed in README | FAIL | FAIL: README missing license-MIT badge | PASS |
| M15 | LICENSE copyright holder changed | FAIL | FAIL: LICENSE copyright holder is not Angelo MT | PASS |
| M16 | LICENSE final newline removed | FAIL | FAIL: LICENSE has no final newline | PASS |
| M17 | Stale "Level / Template" snapshot field added to output-format | FAIL | FAIL: stale 'Level / Template' snapshot field still referenced | PASS |
| M18 | A "Repo documents" section added to SKILL.md | FAIL | FAIL: SKILL.md must not explain repository documents (README owns that) | PASS |
| M19 | Assumptions block removed from T3 | FAIL | FAIL: T3-strategic.md missing: Assumptions to verify (not confirmed): | PASS |
| M20 | Delivered "Why this structure" block returned to T5 | FAIL | FAIL: T5-marketing.md repeats the delivered Why this structure block (owned by assets/outp | PASS |
| M21 | Assumptions listed after the prompt in an example | FAIL | FAIL: assets/examples/example-legal.md puts the assumptions after the prompt | PASS |
| M22 | "Not this template" boundary removed from T10 | FAIL | FAIL: T10-growth missing its Not this template boundary | PASS |
| M23 | T6 row removed from the question-bank priority table | FAIL | FAIL: question-bank priority order missing: T6 People | PASS |
| M24 | A Level line added to an example snapshot | FAIL | FAIL: assets/examples/example-crisis.md shows the internal level in the delivered output | PASS |
| M25 | Redaction section removed from output-format | FAIL | FAIL: output-format lacks: ## Redaction | PASS |
| M26 | Query hygiene section removed from research guide | FAIL | FAIL: research guide lacks query hygiene | PASS |
| M27 | Choice-fields rule removed from output-format | FAIL | FAIL: output-format lacks: **Choice fields.** | PASS |

Control (unmodified copy): all checks pass.

## Behavioral tests

### How they were run

Each test gives the skill's own files to the session as its instructions and records the exact input, any simulated user reply, and the response the skill produced. Recorded outputs were checked by script assertions (prompt count, no unfilled brackets, no displayed level, no persona or summary, no figure absent from the user's text, In my words verbatim, assumptions placement, rationale length, and test-specific rules) and read manually. Live web search was exercised in B13, B20 and B22.

### Limits of this evidence

- The runs were made in the session that wrote the skill, and the simulated user replies were written by that session. This is execution of the skill, but it is not an independent run.
- Phase 2 research was exercised live only in B13, B20 and B22. In the other runs Phase 2 was not executed and the Research context block is omitted, as in a session without search.
- B04 could not be run: the search tool cannot be disabled in the session that wrote the skill. B09 shows only the trigger decision.

### Results

| ID | Input | Expected behavior | Observed | Status |
|---|---|---|---|---|
| B01 | "my customers keep complaining and i dont know what to do anymore its getting worse" | One batch of at most 4 gap questions; then T1; prompt has In my words, Known, Outcome; no persona line, no numbered need list | 4 questions in one batch (type and industry combined); T1 prompt; In my words verbatim; no persona, no list | PASS |
| B02 | A detailed message with type, problem, duration, figures, attempts and goal | Fast path: no questions, one-line statement of assumptions, prompt delivered | No questions; opening line stated the approach; T5 prompt; the user's suspicion labeled as a hypothesis | PASS |
| B03 | A cash-flow message where the user says "no idea what my cash balance is" | Cash balance under Not provided yet; no invented figure | T4; cash balance listed as not provided with no number and not asked again; 3 questions | PASS |
| B04 | Any request in a session with no search tool | Says once that research is unavailable; no Research context block; no statistics from memory | Not run. Blocker: the search tool cannot be disabled in the session that authored this release, and no independent runner was available | Not Run |
| B05 | "we might go bankrupt eventually if things keep going like this" | Domain template (T4 or T3), not T8 or T9; level not raised by seriousness | T4; no hard clock claimed; 4 questions with type and industry joined to the first | PASS |
| B06 | "Payroll is in 5 days and our account is frozen" | T9; hard clock stated; 72-hour outcome; level not displayed | T9; hard clock line; 72-hour outcome; 3 questions; currency flagged as an assumption before the prompt and inside it, not under Known | PASS |
| B07 | Two problems the user says feed each other, 8 months of cash | T8; suspected links as hypotheses; outcome asks the advisor to test them | T8 (not T9); both links written as hypotheses; test outcome; 2 questions | PASS |
| B08 | "my website is slow and i need an NDA" | Interaction test fails; separate prompts, user's priority first | Priority asked; two prompts, NDA first, each in its own block; jurisdiction in the NDA prompt | PASS |
| B09 | "Why are we short on cash?" (advice, not a prompt) | Skill does not run its flow; the question goes to business-advisor-pro | No snapshot, no prompt block, handed to business-advisor-pro. Limited: only the trigger decision is observable; the advisor run itself was not exercised | PASS |
| B10 | An employment dispute with no country given | Country asked in the batch; Jurisdiction in the prompt | T7; country asked first; Jurisdiction: United Kingdom (England) in the prompt | PASS |
| B11 | "my shop isnt doing well lately, just write the prompt, no questions" | Prompt built with Not provided lines; missing items named; no refusal | No questions, no refusal; T1; missing items listed; business type not guessed; thin-prompt warning | PASS |
| B12 | "Make this a prompt for business-advisor, not pro" with full T4 facts | Same prompt body; Target line names business-advisor | Target: business-advisor; same body; no mention of pro | PASS |
| B13 | A request with search available (SaaS churn) | Sourced figures carry source, date and business type; otherwise a labeled Pattern; no link list | 1 live search (privacy-safe query); one Benchmark line with business type, source and date; one labeled Pattern; no links | PASS |
| B14 | Delivered output of every run | Prompt body once, alone in its own code block; Why this structure 2 to 4 sentences; no Summary; no Level | Checked on all 19 deliveries; the repair output has no Why block by design | PASS |
| B15 | An existing messy prompt (contradictory member count, persona, format requests) | Before → Fix → After; original intent kept; no added fact; revised prompt in its own block | Both counts kept under Not provided yet; no figure added; "make me rich" kept in the user's words; format requests moved, not dropped; one revised block | PASS |
| B16 | Five independent problems in one message | Separate prompts; user's priority first; too many: first in full and offer the rest | Priority asked; first prompt (trademark) in full; four others listed; continuation offered | PASS |
| B17 | "cash is really tight. consulting firm, 8 people." then answers revealing payroll in 6 days | Provisional T4; at most 4 questions with one combined numbers question; final template follows the answers | Provisional T4; 4 questions, the first combined; finalized as T9; no second batch | PASS |
| B18 | "my business is struggling. make the prompt now." | Prompt built; warning names the one or two most useful missing facts | Prompt built; one warning naming two facts; no refusal | PASS |
| B19 | Taglish input and Filipino input | Output in the user's language; In my words verbatim | Both prompts in Taglish and Filipino; In my words identical to the input, including code-switching; thin warning in Filipino | PASS |
| B20 | A message with a personal name, company, email and invoice number, once without and once with a redaction request | Redaction offered, applied only when authorized, labeled | Without request: offer made, text unchanged. With request: Person A, Client A, [REDACTED EMAIL], [REDACTED IDENTIFIER] used consistently, labeled in the snapshot and in the prompt, no original detail left | PASS |
| B21 | "Quick, no questions" price-increase message with an unstated unit | Material assumption before the prompt and inside it; never under Known | Unit of the increase listed before the prompt and under Assumptions to verify (not confirmed); not under Known; the user's worry kept as a labeled suspicion | PASS |
| B22 | The B20 message (private details present) | Search queries free of private details | 1 live search; the query has no name, email, identifier or amount; light path for a simple problem | PASS |

Totals: 21 PASS, 0 FAIL, 1 Not Run (B04).
