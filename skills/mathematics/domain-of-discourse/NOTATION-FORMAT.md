# NOTATION.md format

```markdown
# Notation and conventions

## Standing assumptions
- All rings are commutative with 1. Graphs are finite and simple.
- ℕ = {0, 1, 2, ...}. log is the natural logarithm.

## Symbols
| Symbol | Meaning | Notes |
| --- | --- | --- |
| `\hat f(\xi)` | ∫ f(x) e^{-2πi x ξ} dx | See docs/conventions/0001 |
| `p(n)` | number of partitions of n | p(0) = 1 |

## Terms
**Admissible pair**: a pair (G, H) with H ≤ G a subgroup of index at most 2.
_Not to be confused with_: "admissible representation".

## Differences from the literature and from Mathlib
- Source X (arXiv id) defines σ_k with a normalising factor; we do not.
```

Keep each entry to the definition plus at most one clarifying line. Proofs and motivation belong in the manuscript.
