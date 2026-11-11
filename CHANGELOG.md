# Changelog

Notes for each release, covering the major changes to the skill itself.

## [0.4.1] — 2026-11-09

First release.

### Added

- **Gap-based intake.** The skill sorts what the user said into known and missing, makes a provisional template pick, asks only for the gaps that template needs (one batch, at most four questions, combined questions allowed), then finalizes the template from the answers. A complete message is not questioned, and a partial answer, "I don't know" or "just do it" is always accepted.
- **Ten templates, T1 to T10.** One shared prompt skeleton adapted to general, operational, strategic, financial, marketing, people, legal, multi-problem, crisis and growth problems, with a selection map, explicit boundaries (T1 as a fallback, T3 versus T10) and a hard-clock rule for T9.
- **Interaction test for several problems.** Interdependent problems become one multi-problem prompt; independent problems each get their own prompt, the user's priority first.
- **Facts keep their origin.** Everything in the prompt is the user's own words, a known fact, a missing item, an assumption, a labeled user hypothesis or labeled research. Nothing the user did not say appears as a fact, including template choice fields.
- **Assumptions to verify.** Material assumptions are shown before the prompt and again inside it, never under known facts.
- **Research with provenance and privacy.** Normal, simple and rushing research paths; a sourced figure carries source, date and business type, otherwise it is a labeled pattern; search queries never carry private names, emails, identifiers or exact internal figures; without a search tool the research block is omitted.
- **Repair mode.** An existing prompt is improved, not rebuilt: the original intent and constraints are kept, no business fact is added, contradictions are listed with both versions, and the result is a Before → Fix → After summary plus the revised prompt in its own code block.
- **Delivery format.** A short snapshot, the prompt alone in one code block, and a short rationale; a thin-prompt warning when most key facts are missing; several prompts under one heading; optional, authorized redaction with clear markers; the prompt follows the user's language and the user's own words stay verbatim.
- **Pre-delivery self-check.** A silent ten-point check before any prompt is delivered.
- **Aligned to the advisors.** The four business types, jurisdiction wherever law, tax, employment, privacy or fundraising is involved, and the financial template's essential inputs match what business-advisor-pro needs. business-advisor is accepted as the target with the same prompt body.
- **Narrow trigger.** The skill runs only when the user wants a prompt written, fixed or structured; a plain request for advice goes to the advisor.
- **Verification.** Four shell checks (`scripts/verify-all.sh`), check-sensitivity mutations, and 22 behavioral tests in `TESTS.md`.
