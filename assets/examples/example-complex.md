# Example — Interacting problems (T8)

Illustrative: a fictional business. Research lines show the format only; in a real run a sourced figure carries a real source and date.

## What the user said

> revenue dropped, two people quit, we lost our biggest client and nobody has time for sales anymore

## Classification

Interaction test: the user suspects the client loss drove the revenue drop and the resignations, and that the stretched team explains the missing sales effort, which in turn blocks recovery. Changing the answer to one part would change the question for another, so the level is Complex. There is no hard clock (runway is months), so the template is T8, not T9.

## Intake

Provisional pick: T8 (several problems the user says are linked). Missing and essential: runway, what has been tried on each problem, which links the user suspects, constraints. One batch of four questions was asked.

Answers: a marketing agency of five remaining staff plus one freelancer; monthly revenue fell from about 30,000 to about 18,000 over two months (USD); two senior people resigned last month; no outbound sales since the team is stretched; runway about four months; a small reserve is available; the goal is to stabilize within a quarter. The user said they think the client loss caused both the revenue drop and the resignations, and that having no time for sales is why revenue is not recovering. Nothing has been tried yet.

## Research

Two queries on agency recovery after losing a major client, with no names or figures in them. No figure passed the filter, so one qualitative pattern is kept.

## Delivered output

## 📋 Business Visual Prompt

**Topic:** Revenue drop, resignations and no sales effort after losing a major client
**Problem:** An agency lost its largest client, revenue fell sharply, two senior people resigned and sales activity stopped; the user suspects these are linked.
**Task:** Test whether the problems depend on each other, then say what to address first and why.
**Template:** T8 Complex Multi-Problem
**Target:** business-advisor-pro

### Prompt to send

```text
In my words:
"revenue dropped, two people quit, we lost our biggest client and nobody has time for sales anymore"

Business:
- Type: service-based
- Industry: marketing agency

Known (please don't re-ask):
- Five staff remain, plus one freelancer
- Monthly revenue fell from about 30,000 to about 18,000 over two months (USD)
- Runway is about four months
- Nothing has been tried yet

Problems:
1. Financial: revenue fell sharply after the loss of our largest client
2. People: two senior team members resigned last month
3. Sales: no outbound sales activity because the team is stretched

Suspected links (my hypotheses, not conclusions):
- I think the client loss caused both the revenue drop and the resignations.
- I think the team having no time for sales is why revenue is not recovering.

Research context (unverified unless sourced):
- Pattern (unverified): after losing a major client, agencies often face revenue loss, staff uncertainty and stalled business development at the same time.

Constraints:
- Budget: a small reserve (amount not provided)
- Timeline: stabilize within a quarter
- Resources: five staff and one freelancer

Outcome I want:
Test whether these problems really depend on each other. If they do, tell me which to address first, why, and what to avoid doing out of order. If some are independent, say so and treat them separately.
```

### Why this structure

The user suspects the problems are connected, so the prompt states those suspicions as hypotheses and asks the advisor to test them. This leaves the advisor free to decide whether to coordinate the problems together or separately, and to sequence the work if they do interact.
