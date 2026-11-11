# Example — Repairing an existing prompt

Illustrative: a fictional business. Repair mode does not run the full intake: the existing prompt already holds most of what is needed, so nothing is asked and no research is run.

## What the user said

> Fix this prompt for me:
>
> Act as a world-class business consultant. My bakery is losing money. I run it alone but my 3 employees are not good. Prices maybe too high or marketing is bad. Give me a 10 step plan with a summary. I'm in Cebu. Budget is small.

## Analysis

Original purpose: get a plan to stop a bakery losing money. Findings: the team size contradicts itself; no figures at all; a guess about the cause is mixed in with the facts; instructions about how to answer are mixed in with the problem; no business type is named. No business fact was added and nothing was resolved on the user's behalf.

## Delivered output

## 🔧 Prompt repair

**Original purpose:** Get a plan to stop a bakery losing money.

### Before → Fix → After

- **Before:** "I run it alone but my 3 employees are not good" gives two different team sizes.
  **Fix:** Not resolved. Both versions are listed under *Not provided yet* for you to settle.
  **After:** The advisor knows the team size is open instead of trusting one version.
- **Before:** "losing money" with no figures.
  **Fix:** Added the missing items as questions in *Not provided yet* (revenue, costs, size of the loss, currency, cash balance). No number was invented.
  **After:** The advisor can ask for the right figures instead of guessing.
- **Before:** "Prices maybe too high or marketing is bad" sat among the facts.
  **Fix:** Moved to a labeled suspicion.
  **After:** The advisor tests it instead of treating it as established.
- **Before:** The persona, the 10-step plan and the summary were mixed into the problem.
  **Fix:** Kept as you wrote them under *My format requests*. The advisor normally picks its own method, so you may delete that section.
  **After:** Facts and format requests are separate, and nothing you asked for was dropped.
- **Before:** No business type.
  **Fix:** A bakery maps plainly to local brick-and-mortar.
  **After:** The advisor can adapt to the right business type.

### Revised prompt

```text
In my words:
"My bakery is losing money. I run it alone but my 3 employees are not good. Prices maybe too high or marketing is bad. I'm in Cebu. Budget is small."

Business:
- Type: local brick-and-mortar
- Industry: bakery

Known (please don't re-ask):
- The bakery is losing money
- It is in Cebu
- The budget is small

My own suspicion (my hypothesis, not verified):
- Prices may be too high, or marketing may be bad

Not provided yet:
- Team size: my message says both that I run it alone and that I have 3 employees; I will confirm which is right
- Revenue and costs per period, the size of the loss, and the currency
- Cash balance now
- The budget amount

My format requests (from my original prompt):
- Answer as a world-class business consultant
- A 10 step plan with a summary

Outcome I want:
A plan to stop the bakery losing money, starting with whether the cause is pricing, marketing or something else.
```
