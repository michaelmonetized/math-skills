---
name: epsilon-delta-grilling
description: Interview the user relentlessly about a conjecture, proof strategy, definition, or research plan until every branch is resolved. Use when the user wants their mathematical thinking stress-tested, says "grill", or is about to start proving something whose statement is not yet pinned down.
---

For every epsilon of vagueness the user offers, find the delta that removes it. Interview until you and the user share one precise understanding of the mathematics. Track it as a **question tree**: each decision (what the statement says, which hypotheses, which approach) branches into the decisions that depend on it.

## Rounds

Work the tree in **rounds**. The **frontier** is every open question whose prerequisites are already settled. Ask the whole frontier at once, numbered, each with your recommended answer, then stop and wait.

```
❓ **Q1** - **<short title>**: <the question; options if it branches>

➡️ <recommended answer, and the one-line reason>

---

❓ **Q2** - ...
```

Phrase each question so that "yes" accepts your recommendation. A question that depends on another open question in the same round waits for the next round. After each round, recompute the frontier.

## What to grill, in roughly this order

1. **The statement.** Write it back in one display: every object typed, every quantifier explicit and in order (∀ε ∃δ is not ∃δ ∀ε). Ask what the conclusion would look like for the simplest nontrivial instance.
2. **The ambient conventions.** Does ℕ contain 0? Rings unital and commutative? Graphs simple? Measures finite or σ-finite? "Positive" meaning > 0 or ≥ 0? Log base? Normalisation of the Fourier transform? Any of these can flip a statement.
3. **Each hypothesis, one at a time.** Is it used? What breaks without it? Is there a standard example showing it is needed? If nobody can say where a hypothesis is used, that is either a gap or a stronger theorem.
4. **Edge and degenerate cases.** n = 0, 1, 2; the empty set; the trivial group; characteristic 2 or p; dimension 0 or 1; non-compact, non-separable, infinite-dimensional; boundary of the parameter range.
5. **Novelty.** Is it known, a special case of something known, or known to be false? This is a fact, not a decision (see below).
6. **What counts as done.** A proof? A proof plus a Lean formalisation? A counterexample? A numerical table to a stated range? A sharp constant or just the order of growth?
7. **Strategy.** Which approach, which lemmas, what is the hardest step, and what would a first failed attempt most likely look like?

## Facts are yours, decisions are theirs

Never ask the user something you could compute or look up. Small cases, sanity checks, and counterexample searches: run them (call the Skill tool with "sorry-driven-development" for the counterexample discipline). Whether a result is already in the literature: dispatch a sub-agent with the "researxiv" skill. A pending lookup only blocks the questions downstream of it; ask the rest of the frontier now.

Report what you found as evidence with provenance ("checked n ≤ 12 by exhaustive search, script at `scratch/check.py`"; "zbMATH Open returns Zbl xxxx, statement matches Theorem 2"), never as unsupported recollection. If you remember a reference but have not verified it this session, say so and mark it unverified.

The decisions (which statement, which conventions, which approach, what counts as done) belong to the user. Put each one to them and wait.

## Done

The session is done when the frontier is empty: the statement is precise, every hypothesis has a stated role, every edge case has an answer, and nothing is silently assumed. Summarise the settled tree and do not start proving until the user confirms it.
