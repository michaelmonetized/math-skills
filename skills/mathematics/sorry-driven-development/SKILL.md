---
name: sorry-driven-development
description: Check-first proving with a red-green loop. Use when the user wants to prove or formalise a result lemma by lemma, mentions "red-green", wants numerical or small-case checks before a proof, wants to hunt for counterexamples, or is filling in `sorry`s in Lean.
---

# Sorry-Driven Development

The mathematical red-green loop. **Red**: a statement exists together with a check that could fail: a small-case computation, a numerical evaluation, or a Lean statement that compiles with `sorry`. **Green**: the check passes and, for proved pieces, the proof is written (on paper with every step justified, or in Lean with the `sorry` gone). This skill is the reference for making that loop produce checks and proofs worth keeping.

If the project has `NOTATION.md`, read it first, so statements and scripts use the project's conventions (indexing, normalisations, whether ℕ starts at 0).

## What a good check is

A check tests the **statement**, not the proof. It reads like the claim itself: "for all n ≤ 30, a(n) equals the closed form" or "the inequality holds at 10^4 random points with exact rational arithmetic". It survives any rewrite of the proof.

Its expected values come from an **independent** source: a brute-force enumeration, the OEIS, a hand computation, a published table. Never from the formula under test. See [CHECKS.md](CHECKS.md).

## Seams: where checks go

A **seam** is a lemma statement: the interface between pieces of the proof. Checks and `sorry`s live at seams.

**Agree the seams first.** Before writing any check, list the lemma statements you propose to check and confirm them with the user, each with one line on what its check would catch and what it would miss. You cannot check everything; agreeing seams puts effort on the risky steps (the inequality with a lost constant, the interchange of limits, the case analysis) instead of the routine ones.

When the shape of the lemmas themselves is in question (what to state, how general, where to split), call the Skill tool with "codomain-design".

## The loop

1. **State it.** Write the lemma precisely. In Lean, state it with `:= by sorry` and make sure it compiles; a statement that does not typecheck is not even red. Use `#check` on the objects you mention to confirm they are what you think (Lean's `ℕ` subtraction truncates: `2 - 3 = 0`; `/` on `ℕ` and `ℤ` is integer division, not exact division).
2. **Go red.** Write and run the check. If it fails, you have saved a proof attempt: you have a counterexample or a wrong statement. Hunt for counterexamples deliberately before trying to prove anything nontrivial; see [COUNTEREXAMPLES.md](COUNTEREXAMPLES.md).
3. **Go green.** Prove only this lemma, using only already-green lemmas. In Lean, try `exact?`, `apply?`, `rw?`, and `simp?` before writing long proofs; search Mathlib with Loogle (https://loogle.lean-lang.org) by constant, pattern, or conclusion, or with LeanSearch (https://leansearch.net) in natural language. Finishing tactics worth knowing: `norm_num`, `ring`, `linarith`, `nlinarith`, `positivity`, `omega`, `decide`, `field_simp`, `gcongr`, `aesop`.
4. **Confirm green.** On paper: every step names its justification. In Lean: `lake build` passes and `#print axioms <name>` does not list `sorryAx`.
5. Next seam.

## Anti-patterns

- **Tautological checks**: the script computes both sides the same way, or evaluates the claimed closed form and compares it with itself. It can never fail.
- **The strong law of small numbers** (R. K. Guy): a pattern verified for small n is evidence, not proof. n² + n + 41 is prime for 0 ≤ n ≤ 39 and fails at n = 40. The Pólya conjecture fails first at 906,150,257. Report the range checked, always.
- **Floating-point equality**: comparing exact identities in double precision. Use exact rationals or algebraic numbers where possible, and high precision (mpmath `mp.dps`) or ball arithmetic otherwise.
- **Horizontal slicing**: stating every lemma up front and proving none, then discovering the main argument needs different ones. Work in vertical slices: one lemma stated, checked, proved, and used, then the next.
- **Proving a lemma nobody uses.** Each lemma must have a consumer in the main argument.

## Rules of the loop

- **Red before green.** No proof attempt without a check or a compiling statement.
- **One seam at a time.**
- **Restructuring is not part of the loop.** Cleaning up statements and merging lemmas belongs to review (the `qed-review` skill).
