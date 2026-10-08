---
name: diagonalizing-bugs
description: Diagnosis loop for mathematics that has gone wrong. Use when a formula disagrees with numerics, two derivations give different answers, a computation or Lean proof fails unexpectedly, an argument seems to prove too much, or the user says "something's off" or "debug this".
---

# Diagonalizing Bugs

A discipline for finding where mathematics went wrong. Skip phases only with a stated reason.

Read `NOTATION.md` and the convention records first: a large share of "wrong" formulas are right formulas under a different convention.

## Phase 1: Build a feedback loop

**This is the skill.** If you have one command that exhibits the discrepancy (prints the two values that should agree and they don't), you will find the cause. Without it, rereading the derivation is mostly hope.

Ways to get one, roughly in this order:

1. **Evaluate both sides** at a specific small case with exact arithmetic (SymPy, PARI/GP, SageMath).
2. **Brute force against formula**: enumerate the objects for small parameters and compare with the closed form.
3. **Two derivations, one script**: implement each derivation's intermediate expressions and print them side by side.
4. **Prove-too-much test**: apply the argument to a case where the conclusion is known to be false. If it still "works", the gap is in a step that does not see the difference.
5. **Lean**: the failing goal, isolated in a fresh `example` with only the hypotheses it needs; read the exact goal state rather than the one you expected.
6. **Literature differential**: your formula against a published table or the OEIS, after aligning conventions.

Tighten it: exact instead of floating point, smallest parameters that still fail, deterministic seeds, seconds not minutes.

**Done when** you can name one command, already run, whose output shows the discrepancy, and which would show agreement once fixed. No such command, no Phase 2. If you genuinely cannot build one, say so, list what you tried, and ask the user for the missing piece (their script, the source of the formula, the exact statement they are using).

## Phase 2: Reproduce and minimise

Confirm the loop shows the user's discrepancy, not a different nearby one. Then shrink: smallest n, simplest parameters, fewest terms, until every remaining ingredient is load-bearing. The minimal failing case is usually the diagnosis.

## Phase 3: Hypothesise

Write 3 to 5 ranked, falsifiable hypotheses before testing any: "If the cause is X, then changing Y will make the values agree." Common causes:

- **Convention mismatch**: ℕ from 0 vs 1, Fourier normalisation (2π in the exponent vs in front), log base, binomial or Stirling number conventions, sign conventions for curvature or Laplacians.
- **Index slip**: off by one in a sum or recursion; the n = 0 term; empty products.
- **Silent hypothesis**: the formula is valid only for n ≥ 2, x > 0, odd p, or away from a pole, and the test case sits outside.
- **Branch cut**: complex logs, square roots, and powers.
- **Interchange**: limits, sums, and integrals swapped without justification (dominated or monotone convergence, Fubini–Tonelli); conditionally convergent series rearranged.
- **Numerics**: cancellation, insufficient precision, an ill-conditioned problem, a quadrature routine silently missing a singularity.
- **Lean specifics**: truncated subtraction and floor division on `ℕ`; division by zero is defined as `0`; an unexpected coercion (`↑`) in the goal.
- **Source error**: the reference itself has a typo; check the latest version and errata.

Show the ranked list to the user before testing: they often know which convention their source used.

## Phase 4: Instrument

One variable at a time, each probe tied to a hypothesis. Print intermediate quantities at the minimal case, in exact arithmetic. Raise precision and confirm digits are stable (mpmath `mp.dps`, ball arithmetic). Tag scratch output files with a unique prefix so cleanup is one command.

## Phase 5: Fix and lock it in

Add the minimal failing case as a permanent check (see the `sorry-driven-development` skill) before applying the fix, watch it fail, apply the fix, watch it pass, then re-run the original loop at the original parameters.

## Phase 6: Clean up and record

- [ ] The original discrepancy is gone at the original parameters.
- [ ] The regression check is saved and passes.
- [ ] Scratch files removed or moved to a marked scratch directory.
- [ ] The cause is written down where the next reader will see it: a convention record if it was a convention, a remark in the manuscript if a reader could fall into it too, the commit message otherwise.
