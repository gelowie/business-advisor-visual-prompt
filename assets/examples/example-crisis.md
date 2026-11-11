# Example — Crisis with a hard clock (T9)

Illustrative: a fictional business. Research lines show the format only; in a real run a sourced figure carries a real source and date.

## What the user said

> our payment processor froze our account yesterday and payroll is in 8 days

## Classification

Hard clock: payroll is due in eight days, so the template is T9. There is one problem and no interacting ones, so the level is Moderate, not Complex. Urgency alone did not raise the level.

## Intake

Provisional pick: T9 (hard clock). Missing and essential, in T9 priority order: the hard clock detail and what happened, who knows, resources now. One batch of four questions was asked.

Answers: an online software subscription business in the United States; the processor cited a review of recent chargebacks; about 22,000 is held (USD); payroll is about 15,000; no backup processor; customers cannot check out; the team has not been told; an accountant is available, no lawyer.

## Research

One query on processor account freezes and fund release (a hard clock, so the light path), with no amounts in it. No figure passed the filter, so one qualitative pattern is kept.

## Delivered output

## 📋 Business Visual Prompt

**Topic:** Frozen payment processor account with payroll due in eight days
**Problem:** The processor froze the account and is holding funds, customers cannot check out, and payroll is due in eight days with no backup processor.
**Task:** Give the first actions for the next 72 hours, then communication and recovery.
**Template:** T9 Crisis
**Target:** business-advisor-pro

### Prompt to send

```text
In my words:
"our payment processor froze our account yesterday and payroll is in 8 days"

Business:
- Type: digital product/SaaS
- Industry: online software subscriptions
- Jurisdiction: United States

Known (please don't re-ask):
- The processor cited a review of recent chargebacks
- About 22,000 is held (USD)
- Payroll is about 15,000 and due in eight days
- Customers cannot check out
- No backup processor is set up
- The team has not been told

The crisis:
- Type: financial
- What happened and when: the account was frozen yesterday
- Hard clock: payroll in eight days

Resources right now:
- External support: an accountant is available; no lawyer

Not provided yet:
- Cash on hand outside the held funds
- Terms of the processor agreement

Research context (unverified unless sourced):
- Pattern (unverified): processors often review held funds after a documentation request or appeal, and timelines and terms vary by processor and contract.

Outcome I want:
First: the actions for the next 72 hours in order, and what not to do. Then: how to communicate with the people affected, and an outline for recovery once things are stable.
```

### Why this structure

A hard clock makes sequence more important than breadth, so the prompt leads with the clock, the held funds and who already knows. The outcome is ordered by time: act now, communicate, then recover. No other problems are listed because none connect to the freeze.
