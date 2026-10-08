---
name: improve-base-change-architecture
description: Survey a manuscript or Lean development for restructuring opportunities (lemmas to extract, merge, or generalise; tangled dependencies; definitions in several guises), present them as an HTML report, then grill through whichever one you pick. Use every so often on a growing manuscript or Lean project, or when proofs keep repeating themselves.
disable-model-invocation: true
---

# Improve Base-Change Architecture

Find places where the structure of a paper, a set of notes, or a Lean development is making it harder to check, extend, or formalise, and propose **deepening opportunities**: restructurings that turn many shallow lemmas into fewer deep ones, or pull a repeated argument into one place.

Use the vocabulary from the `codomain-design` skill exactly (lemma, statement, proof, depth, cut, instance, leverage, locality). Respect `NOTATION.md` and the convention records: they are decisions, not candidates for relitigating.

## Process

### 1. Explore

**Decide where to look first.** If the user names a section, file, or pain point, start there. Otherwise read `git log --oneline` for the files that keep changing: restructuring pays off where work is still happening.

Then explore (a sub-agent can do this) and note friction:

- The same argument (an estimate, a diagram chase, a case split) written out more than once.
- Lemmas with long hypothesis lists used exactly once (shallow; candidates to inline).
- Long proofs with an obvious internal cut that would make a reusable lemma.
- One concept defined twice in different guises, or a definition whose equivalent forms are proved ad hoc in several places.
- Dependency tangles: forward references, a lemma in Section 2 that needs Section 5, near-circularity.
- In Lean: proofs that re-derive something Mathlib already has (check with Loogle or `exact?`); statements specialised to `ℝ` where the proof works over any field; very slow files (check with `set_option profiler true` on suspects).

Apply the deletion test to each suspected shallow lemma: does inlining it concentrate complexity (keep it) or just move it (delete it)?

### 2. Present the report

Write a self-contained HTML file to the OS temp directory (`$TMPDIR`, else `/tmp`), e.g. `<tmpdir>/base-change-review-<timestamp>.html`, render math with KaTeX or MathJax from a CDN, open it (`xdg-open`, `open`, or `start`), and give the absolute path. For each candidate:

- **Where**: labels and files.
- **Now**: the current structure, with a small dependency diagram if it helps.
- **Proposed**: the new statement(s) and what they replace.
- **Leverage**: which proofs get shorter or which future results get easier.
- **Cost and risk**: how many proofs change, and whether any main statement changes (that is always the author's call).

Order by leverage per unit of cost. Do not change any files yet.

### 3. Grilling loop

Ask which candidate to pursue. Then call the Skill tool with "epsilon-delta-grilling" to settle the new statements and cuts. When the design is settled, suggest `/to-tikzets` to turn it into tickets.
