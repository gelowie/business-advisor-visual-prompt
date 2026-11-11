# Example — Financial problem (T4)

Illustrative: a fictional business. Research lines show the format only; in a real run a sourced figure carries a real source and date.

## What the user said

> revenue looks fine but i cant pay my suppliers on time lately and im not sure why

## Intake

Provisional pick: T4 (cash and late supplier payments). Missing and essential, in T4 priority order: the numbers, how customers and suppliers pay, what changed. One batch of three questions was asked, the first being the combined numbers question (currency, period, cash balance, revenue and expenses).

Answers: an online home-goods store; figures in USD per month; revenue about 42,000 and expenses about 39,000; customers pay at checkout; suppliers were net-30 but now want payment upfront on reorders after two late payments; a large inventory batch was bought two months ago for a volume discount; a small credit line exists and the balance is not known. The user does not know the exact cash balance and estimates 5,000 to 9,000.

Jurisdiction was left out: the outcome is a diagnosis, and no tax, payroll or funding question is involved.

## Research

Two queries on cash shortfalls in profitable-looking e-commerce businesses, with no figures in them. No figure passed the filter, so one qualitative pattern is kept.

## Delivered output

## 📋 Business Visual Prompt

**Topic:** Cash shortage in a profitable-looking online store
**Problem:** Revenue exceeds expenses on paper, but supplier payments are late and suppliers now demand upfront payment.
**Task:** Explain why cash is tight and what to change first.
**Template:** T4 Financial
**Target:** business-advisor-pro

### Prompt to send

```text
In my words:
"revenue looks fine but i cant pay my suppliers on time lately and im not sure why"

Business:
- Type: physical product/e-commerce
- Industry: home goods, online store

Known (please don't re-ask):
- Currency USD, figures per month
- Revenue about 42,000 and expenses about 39,000
- Customers pay at checkout
- Suppliers were net-30; after two late payments they want upfront payment on reorders
- A large inventory batch was bought two months ago for a volume discount
- A small credit line exists

Not provided yet:
- Exact cash balance (my estimate: 5,000 to 9,000)
- Credit line balance and limit
- Net monthly burn

Research context (unverified unless sourced):
- Pattern (unverified): a business can look profitable while short of cash when inventory purchases and supplier terms tighten faster than sales convert back to cash.

Outcome I want:
Explain why cash is tight and what to change first.
```

### Why this structure

Financial advice depends on its inputs, so the prompt carries the figures the advisor needs: currency, period, revenue, expenses and payment terms. Missing numbers are listed as not provided with a labeled range instead of being guessed. One outcome is requested so the answer is a diagnosis, not a list of every possible fix.
