<div align="center">
<img src="https://user49385.na.imgto.link/public/20261114/6ed8485386d71fa8fa744d91-repoicon.avif" width="300" alt="business-advisor-visual-prompt icon">
  
# business-advisor-visual-prompt
 
**Turn a messy business problem, or an existing prompt, into one clean, structured, copy-paste-ready prompt.**
 
[![Skill: business-advisor-visual-prompt](https://img.shields.io/badge/skill-business--advisor--visual--prompt-1E3A8A?style=flat-square)](SKILL.md) [![Version 0.4.1](https://img.shields.io/badge/version-0.4.1-2563EB?style=flat-square)](CHANGELOG.md) [![License: MIT](https://img.shields.io/badge/license-MIT-16A34A?style=flat-square)](LICENSE)
[![Type: AI skill](https://img.shields.io/badge/type-AI_skill-7C3AED?style=flat-square)](SKILL.md) [![Type: agent skill](https://img.shields.io/badge/type-agent_skill-0891B2?style=flat-square)](SKILL.md) [![Works with any AI or agent](https://img.shields.io/badge/works_with-any_AI_or_agent-0F766E?style=flat-square)](#install) [![Role: prompt builder](https://img.shields.io/badge/role-prompt_builder-DB2777?style=flat-square)](#how-it-works)
[![Connected to business-advisor-pro](https://img.shields.io/badge/connected_to-business--advisor--pro-F59E0B?style=flat-square)](#relationship-to-the-business-advisor-skills) [![Connected to business-advisor](https://img.shields.io/badge/connected_to-business--advisor-F59E0B?style=flat-square)](#relationship-to-the-business-advisor-skills) [![Templates: 10](https://img.shields.io/badge/templates-10-475569?style=flat-square)](#the-ten-templates) [![Modes: build and repair](https://img.shields.io/badge/modes-build_%2B_repair-9333EA?style=flat-square)](#two-modes)
[![Asks: at most 4 questions](https://img.shields.io/badge/asks-at_most_4_questions-0E7490?style=flat-square)](#asking-only-what-is-missing) [![Facts: never invented](https://img.shields.io/badge/facts-never_invented-B91C1C?style=flat-square)](#your-facts-stay-yours) [![Assumptions: flagged before you copy](https://img.shields.io/badge/assumptions-flagged_before_you_copy-C2410C?style=flat-square)](#your-facts-stay-yours) [![Research: sourced or labeled](https://img.shields.io/badge/research-sourced_or_labeled-1D4ED8?style=flat-square)](#research-you-can-trace)
[![Privacy: queries carry no private details](https://img.shields.io/badge/privacy-queries_carry_no_private_details-0F766E?style=flat-square)](#privacy-and-redaction) [![Redaction: optional and labeled](https://img.shields.io/badge/redaction-optional_and_labeled-0891B2?style=flat-square)](#privacy-and-redaction) [![Language: follows you](https://img.shields.io/badge/language-follows_you-7C3AED?style=flat-square)](#language) [![Setup: copy one folder](https://img.shields.io/badge/setup-copy_one_folder-475569?style=flat-square)](#install) [![Checks: shell scripts](https://img.shields.io/badge/checks-shell_scripts-334155?style=flat-square)](#verify)
 
</div>

## What it is
 
business-advisor-visual-prompt helps you explain a business problem clearly. You bring rough notes, a vague worry or a prompt you already have. It turns them into **one structured prompt** that [business-advisor-pro](#relationship-to-the-business-advisor-skills) (or business-advisor) can work from without asking you to repeat yourself.
 
It prepares the problem. It does not solve it. If you simply want advice, ask the advisor directly.
 
**Good for you if** you run a small business, a freelance practice, a shop or an agency, and you know something is wrong but find it hard to put into words, or you want your question to arrive complete the first time.
 
## Install
 
1. Copy the folder `business-advisor-visual-prompt/` to wherever your assistant or agent loads skills from, next to `business-advisor-pro/` and `business-advisor/`.
2. Keep the folder name the same as the skill name.
3. Nothing else is needed. The files are plain markdown and shell scripts.

## Use
 
Type the skill name, or just describe what you need:
 
````text
/business-advisor-visual-prompt
````
 
Things you can say:
 
- "My coffee shop has fewer customers since a new chain opened across the street. Turn this into a prompt for the business advisor."
- "I can't explain this problem well. Structure it so I can send it to the business advisor."
- "Here are my messy notes. Make them a prompt."
- "Fix this prompt for me: [paste your prompt]"
- "Make it for business-advisor, not pro."
- "Redact the names before I share it."
What happens next:
 
1. If something important is missing, it asks you once (at most four short questions). If you already gave enough, it asks nothing.
2. It builds the prompt and shows it in a single code block.
3. You copy the block and send it to the advisor, or accept the offer to run it through business-advisor-pro right away.

## A quick example
 
**You say:**
 
> My small coffee shop has fewer customers since a new coffee chain opened across the street about 2 months ago. We used to get around 120 customers a day and now it's about 80. I haven't tried anything yet. I just want my regular customers to come back.
 
You gave the essentials, so nothing is asked. **You get:**
 
````markdown
## 📋 Business Visual Prompt
 
**Topic:** Fewer customers at a small coffee shop after a new chain opened nearby
**Problem:** Daily customers fell from around 120 to about 80 in two months, since a coffee chain opened across the street; nothing has been tried yet.
**Task:** Find why regulars are leaving and which one or two changes to make first.
**Template:** T5 Marketing
**Target:** business-advisor-pro
 
### Prompt to send
 
```text
In my words:
"My small coffee shop has fewer customers since a new coffee chain opened across the street about 2 months ago. We used to get around 120 customers a day and now it's about 80. I haven't tried anything yet. I just want my regular customers to come back."
 
Business:
- Type: local brick-and-mortar
- Industry: coffee shop
 
Known (please don't re-ask):
- A new coffee chain opened across the street about 2 months ago
- Customers per day went from around 120 to about 80
- I have not tried anything yet
- I want my regular customers to come back
 
Marketing today:
- Main symptom: customers leaving
 
What has been tried:
Nothing yet.
 
Not provided yet:
- Who my regular customers are and how they find the shop
- Channels I use today and my monthly marketing budget
- How my menu and prices compare with the chain's
 
Research context (unverified unless sourced):
- Pattern (unverified): reported results for independent cafés near a new chain are mixed; some keep their regulars when customers value atmosphere and personal relationships, while others lose sales on the drinks the chain also sells.
- Pattern (unverified): independents that respond tend to strengthen what a chain cannot copy and make themselves easy to find and to return to, for example by encouraging and answering reviews and building a loyalty habit.
 
Outcome I want:
Find why customers are leaving since the chain opened and which one or two changes to make first. Tell me which metric will show it is working.
```
 
### Why this structure
 
Customers leaving after new competition is a retention problem, so the marketing template fits. Your figures are kept exactly as you gave them, the missing items are listed instead of guessed, and the research lines are labeled as unverified patterns.
````
 
## How it works
 
````
Your rough notes                              An existing prompt
   │                                               │
   ▼                                               ▼
Phase 1  Intake      inventory facts,         Repair mode   keep intent and constraints,
                     provisional template,                  add no facts, show
                     ask the gaps (one batch,               Before → Fix → After
                     at most 4 questions)
   │
   ▼
Phase 2  Research    light or normal depth, privacy-safe queries,
                     provenance rules; confirm the template (T1 to T10)
   │
   ▼
Phase 3  Output      snapshot + assumptions to verify + the prompt alone in
                     its own code block + "Why this structure"
````
 
## Two modes
 
**Build.** Rough notes, a vague description or a messy paragraph go in; a structured prompt comes out, after the three phases above.
 
**Repair.** Paste a prompt you already have and ask for it to be improved. It does not run an interview. It keeps your goal, your constraints and your clear wording, fixes what is unclear, contradictory or missing, and never adds a business fact. A contradiction is listed with both versions for you to settle. You get a short **Before → Fix → After** summary and the complete revised prompt in its own code block. If your prompt is already good, it says so and changes only what helps.
 
## Features
 
### Asking only what is missing
 
- It sorts what you said into what is known and what is missing, picks a provisional template, and asks only about the gaps that matter for that kind of problem.
- It asks once, in one batch of at most four questions, most important first. Each template has its own priority order.
- Related figures can share one question, for example currency, period, revenue, expenses and cash balance.
- If you gave everything needed, it asks nothing and tells you in one line what it assumed.
- Partial answers, "I don't know" and "just do it" are always accepted. If you are in a hurry, it asks the single most important question, or none.
- It never asks for something you already told it.
### The ten templates
 
Each template adapts one shared prompt structure to a kind of problem. The skill chooses by the primary domain of the problem.
 
| Template | For |
|---|---|
| T1 General | One problem that is unclear or still vague (the fallback) |
| T2 Operational | A process or workflow that breaks |
| T3 Strategic | A direction, a pivot or a major decision |
| T4 Financial | Cash, pricing, profitability, funding |
| T5 Marketing | Brand, leads, conversion, customers leaving |
| T6 People | Team, hiring, culture, workplace conflict |
| T7 Legal | Contracts, IP, regulation, disputes |
| T8 Multi-problem | Several problems that depend on each other |
| T9 Crisis | A hard deadline of days or weeks, or a very short runway |
| T10 Growth | Scaling, expansion, a new market |
 
- T3 is about **which direction** to take (a pivot away from what works now). T10 is about **growing what works** (scaling, expansion, a new market).
- A serious or urgent problem is not automatically "complex". Problems are complex when they depend on each other, and the skill tests for that: if solving one would change the question for another, they interact.
- A real deadline of days or weeks selects the crisis template, which leads with the clock, the resources and who already knows.
- Independent problems are never merged. Each gets its own prompt, starting with the one you say matters most.
### Your facts stay yours
 
- **In my words** keeps your own statement verbatim, in your original language and wording.
- Anything you did not say is listed under **Not provided yet**, never filled in. Your estimates stay marked as estimates.
- Material assumptions are shown to you **before** the prompt, under "Assumptions to verify before copying", and again **inside** the prompt, so the advisor can tell them from facts. They are never listed as known facts.
- A suspicion you state is kept as your hypothesis, to be tested, never as a finding.
- A template field that picks from a list (who is involved, who already knows, the main symptom) is filled only when your words settle it.
### Research you can trace
 
- With a search tool, it adds short research context at a depth that fits: normal, simple, or one path when you are rushing.
- A figure carries its **source, date and business type**. Anything less is labeled as an **unverified pattern** with no number.
- Without a search tool, it tells you once and leaves the research out. It never writes research from memory.
### Delivery you can use straight away
 
- A short snapshot: topic, problem, task, template and target.
- The prompt alone in one code block, so the copy button copies exactly the prompt.
- A short note on why the prompt is structured the way it is.
- A gentle warning when you gave very little information. The prompt is still built, and the one or two most useful details to add are named.
- Several prompts when you have several independent problems: up to three appear together, and for more the highest-priority prompt comes first with an offer to continue.
### Care before delivery
 
Before anything is delivered, the skill silently runs a ten-point check: no leftover brackets, no unsupported figures, your facts preserved, assumptions labeled, research sourced or labeled, missing information listed, the right template, the outcome you want, nothing repeated, and a prompt that is ready to copy.
 
## Privacy and redaction
 
- **Search queries stay clean.** They use industry, business type, problem category and market context. They never carry private names, email addresses, account or invoice identifiers, or exact internal figures.
- **Redaction is optional.** When your message contains names, companies, emails or identifiers, the skill offers to redact them. It never changes your text without your agreement.
- **Clear markers.** When you agree, personal names become `Person A`, client names `Client A`, company names `Company A`, emails `[REDACTED EMAIL]` and identifiers `[REDACTED IDENTIFIER]`, used consistently. The snapshot and the prompt both say that redaction was applied, so the advisor treats the markers as intentional.
 
## Language
 
The prompt follows your primary language: English in, English out; Filipino in, Filipino out; Taglish in, natural Taglish out. **In my words** is never translated, rewritten or corrected, and keeps your original expressions and code-switching.
 
## Rules it follows
 
- Every line in the prompt is one of: your own words, a known fact, a missing item, an assumption, your labeled hypothesis, or labeled research.
- The prompt states the outcome you want. It does not dictate a persona, a step count or a method, so the advisor chooses its own approach.
- No unfilled brackets are left in a delivered prompt.
- Plain, direct language.
- Saving the prompt as a file (Word, PDF, text) is left to the environment's own file tools. The prompt text does not change.
## What it does not do
 
- It does not give business advice or solve the problem. That is the advisor's role.
- It does not invent figures, facts or decisions, and it does not guess for you.
- It does not run when you simply ask for advice; that request goes straight to the advisor.
## Relationship to the business-advisor skills
 
| Skill | Role |
|---|---|
| business-advisor-visual-prompt (this repo) | Builds the prompt |
| business-advisor-pro | Default target; four business types, jurisdiction layer, precision gate |
| business-advisor | Alternate target; same prompt body |
 
- It uses the advisors' four business types: service-based, digital product/SaaS, physical product/e-commerce and local brick-and-mortar.
- It asks for jurisdiction whenever law, tax, employment, privacy or fundraising is involved, and always for legal problems.
- The financial template collects what the advisor needs: currency, period, cash balance, revenue, expenses, burn, payment terms and debt.
Field-by-field detail: `references/target-map.md`. This repo does not modify or depend on the other two.
 
## Layout
 
````
business-advisor-visual-prompt/
├── SKILL.md                      the skill the assistant loads
├── README.md                     this file
├── CHANGELOG.md                  release notes
├── DECISIONS.md                  why each rule exists
├── TESTS.md                      checks and behavioral tests
├── LICENSE
├── references/
│   ├── question-bank.md          intake checklist, priority order per template
│   ├── research-guide.md         research depth, query hygiene, provenance, level, template map
│   └── target-map.md             how each field maps to the advisors
├── assets/
│   ├── output-format.md          the delivered format (single owner)
│   ├── prompt-templates/         T1 to T10
│   └── examples/                 worked examples for T1, T4, T7, T8, T9 and a repair
└── scripts/
    ├── verify-all.sh             runs every static check
    ├── verify-structure.sh
    ├── verify-links.sh
    ├── verify-templates.sh
    └── verify-badges.sh
````
 
Content lives in `assets/` and `references/`, like the advisor skills. There is no `tools/` folder, because the skill produces text only.
 
## Verify
 
Run all static checks with one command:
 
````
bash scripts/verify-all.sh
````
 
- `scripts/verify-structure.sh`: required files, frontmatter, template and example inventory, license, line endings, executable scripts
- `scripts/verify-links.sh`: every path reference resolves and every markdown and shell file is reachable
- `scripts/verify-templates.sh`: content rules for the templates, examples and shared documents, including assumptions, template boundaries and the repair format
- `scripts/verify-badges.sh`: the badges above match the repository (version, license, template count, badge set), and no other file carries badges
If the scripts lost their executable bit (for example after unzipping on some systems), run them as `bash scripts/verify-all.sh` or restore it with `chmod +x scripts/*.sh`.
 
Check sensitivity (do the scripts fail when they should?) and 22 behavioral tests, with their results, are in `TESTS.md`.
 
## Changes and decisions
 
- Release notes: `CHANGELOG.md`
- Why each rule exists: `DECISIONS.md`
- Tests and results: `TESTS.md`
## License
 
MIT. See `LICENSE`.
