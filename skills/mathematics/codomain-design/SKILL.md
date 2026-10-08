---
name: codomain-design
description: Shared vocabulary for designing lemmas, definitions, and the structure of a proof or Lean development. Use when deciding how to split a proof into lemmas, how general to state a lemma, where hypotheses belong, how to make a proof easier to check or formalise, or when another skill needs this vocabulary.
---

# Codomain Design

Design **deep lemmas**: a lot of mathematics behind a short statement, placed at a natural cut in the argument, checkable through that statement alone. Use these terms consistently wherever a proof or a formal development is being structured.

## Vocabulary

**Lemma**: anything with a statement and a proof: a lemma, proposition, theorem, or a Lean declaration. Scale-agnostic.

**Statement** (the interface): everything a user of the lemma must know: hypotheses, conclusion, quantifiers, standing assumptions, and conventions. Not just the displayed formula.

**Proof** (the implementation): what sits behind the statement.

**Depth**: what a user gets per unit of statement they must understand. A lemma is **deep** when a short statement hides a lot of proof and is used often; **shallow** when the statement is about as long as the proof, or it restates its own proof in its hypotheses.

**Cut**: a place where a proof can be split so that each side can be checked without reading the other. Choosing the cut is a separate decision from what goes on each side.

**Instance**: a specific application of a general lemma (the general lemma about compact metric spaces, applied to [0, 1]). One instance means the generality is hypothetical; two genuinely different instances mean it is real.

**Leverage**: what users of a deep lemma get: one proof, many applications.

**Locality**: what checkers get: an error, a gap, or a convention lives in one place and is fixed once.

## Principles

- **The statement is the test surface.** A lemma should be checkable (numerically, on examples, or in Lean) through its statement alone. If checking it requires knowing how it will be used, the cut is in the wrong place.
- **The deletion test.** Imagine inlining the lemma into its single use. If the main proof gets *simpler*, the lemma was shallow; delete it. If complexity reappears in several places, it was earning its keep.
- **State the generality the proof gives, not more.** Generalising beyond the instances you have is speculation; generalising to the second instance is design. In Lean, the natural generality is often a typeclass assumption (`[Field K]` rather than `ℝ`), and Mathlib already has the general version more often than you expect: search with Loogle or `exact?` before proving.
- **Hypotheses earn their place.** Every hypothesis should be used, and you should be able to say where. An unused hypothesis is either a stronger lemma or a hidden gap.
- **No long hypothesis lists that restate the proof.** A lemma whose hypotheses are "the five facts the main proof established" is a shallow lemma.
- **Definitions are lemmas too.** A good definition packages a recurring condition so that statements get shorter. Test it on examples and non-examples (the `domain-of-discourse` skill).

## Rejected framings

- "Split every step into its own lemma for readability." Many shallow lemmas make a proof harder to read, not easier: the reader bounces between statements that each say almost nothing.
- "Make every lemma maximally general." Generality nobody instantiates is cost without leverage.
