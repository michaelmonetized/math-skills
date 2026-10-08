---
name: domain-of-discourse
description: Build and sharpen a project's definitions, notation, and conventions. Use when discussing what a term or symbol means, writing or editing NOTATION.md, choosing a normalisation or convention, or recording a convention decision.
---

# Domain of Discourse

Fix what the variables range over, and what every word means, while the mathematics is being designed. This is the active discipline: challenging terms, testing definitions on examples, and writing notation and conventions down the moment they settle. (Merely *reading* `NOTATION.md` before writing a formula is a habit every skill has; this skill is for changing it.)

## Files

```
/
├── NOTATION.md
├── docs/
│   └── conventions/
│       ├── 0001-fourier-transform-normalisation.md
│       └── 0002-graphs-are-simple-and-finite.md
└── paper/
```

Create files lazily: `NOTATION.md` when the first term is settled, `docs/conventions/` when the first convention record is needed. Formats: [NOTATION-FORMAT.md](NOTATION-FORMAT.md) and [CONVENTION-FORMAT.md](CONVENTION-FORMAT.md).

## During the session

### Challenge against NOTATION.md

When the user uses a symbol or term differently from `NOTATION.md`, say so at once: "NOTATION.md has σ(n) as the sum of divisors, but here it looks like the number of prime factors. Which?"

### Disambiguate overloaded words

Mathematics reuses words relentlessly. When one appears, pin it down: *regular* (ring, scheme, graph, measure, or value?), *normal* (subgroup, operator, space, or distribution?), *smooth* (C^∞, or just C^k for the k you need?), *positive* (> 0 or ≥ 0; French usage often means ≥ 0), *ring* (unital? commutative?), *graph* (simple? finite? loops allowed?), *log* (natural?), *ℕ* (contains 0?).

### Test definitions on examples

For each definition, produce the smallest example, the smallest non-example, and one borderline case, and ask the user which side the borderline falls on. A definition that cannot classify its borderline cases is not finished.

### Cross-check the sources

When the user says how something is defined, check the manuscript, the Lean code, and the scripts agree. "`paper.tex` normalises the Haar measure to total mass 1, but `scripts/volume.py` uses the counting measure. Which is intended?" Lean's Mathlib conventions are fixed facts: for instance `Nat` includes 0, and `x / 0 = 0`. Record where the paper's conventions differ from Mathlib's.

### Update NOTATION.md inline

When a term or symbol is settled, write it into `NOTATION.md` right away. It holds definitions, symbols, and standing assumptions only: no proofs, no plans, no scratch work.

### Offer convention records sparingly

Write a convention record only when all three hold:

1. **Hard to reverse**: changing it later means touching many formulas, scripts, or Lean files.
2. **Surprising without context**: a reader or coauthor would ask "why this normalisation?"
3. **A genuine trade-off**: there were real alternatives (e.g. the analyst's vs the number theorist's Fourier convention) and one was chosen for reasons.

Otherwise, a line in `NOTATION.md` is enough.
