# Convention record format

File: `docs/conventions/NNNN-<slug>.md`, numbered in order of creation.

```markdown
# NNNN: <the convention, as a statement>

**Status:** adopted <date> | superseded by NNNN

## Context
What forced a choice. One paragraph.

## Options considered
- Option A: who uses it, what it makes easy, what it makes ugly.
- Option B: ...

## Decision
The choice, stated so it can be applied mechanically.

## Consequences
Formulas, scripts, and Lean statements affected; constants that change when comparing with sources using the other option (e.g. Plancherel picks up a factor of 2π).
```
