# T1 — Basic

**Use when:** One problem that is general, unclear or still vague, in no single domain yet. Fallback only: it never overrides a clearly appropriate domain template.
**Not this template:** a vague message that already names a domain (sales are down, a late payment, a resignation) uses that domain's template.
**Level:** Basic
**Fields marked with a bracket** are filled from what the user said. A field with no user data is removed and, if it matters, listed under *Not provided yet* (see `assets/output-format.md`).

## Template

```text
In my words:
"[...]"

Business:
- Type: [service-based | digital product/SaaS | physical product/e-commerce | local brick-and-mortar]
- Industry: [...]

Known (please don't re-ask):
- [How long it has been happening]
- [What has been tried and what happened]
- [What success looks like]

Not provided yet:
- [...]

Assumptions to verify (not confirmed):
- [...]

Research context (unverified unless sourced):
- [...]

Outcome I want:
Find the most likely root cause and what to do first. If the cause cannot be settled from what I have given, tell me which one or two facts would settle it.
```

## Rationale cue

Single and contained: keep the prompt short, and ask for the cause and the first move, not a long list of fixes.
