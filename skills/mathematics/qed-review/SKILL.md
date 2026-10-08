---
name: qed-review
description: "Review a proof, manuscript, or the changes since a fixed point (commit, tag, branch, or earlier version) along two axes: Rigour (is every step justified?) and Statement (does it prove exactly what it claims, and what the plan asked for?). Runs both reviews as parallel sub-agents and reports them side by side. Use when the user wants a proof checked, a draft reviewed, a referee report, or asks to \"review since X\"."
---

Two-axis review of a proof or manuscript:

- **Rigour**: is every step justified, with no gaps, circularity, or hidden hypotheses?
- **Statement**: does the argument prove exactly the stated result, and is that the result the plan, spec, or user asked for?

Run the two axes as **parallel sub-agents** so neither contaminates the other, then present both.

## Process

### 1. Pin the scope

- **Changes since a fixed point**: `git diff <fixed-point>...HEAD -- '*.tex' '*.lean'` and `git log <fixed-point>..HEAD --oneline`. For a manuscript outside git, compare against the earlier file with `latexdiff old.tex new.tex > diff.tex`.
- **A whole proof or paper**: the file(s) and the theorem(s) under review.

If the user didn't say, ask.

### 2. Find the statement source

The plan, spec, or issue the work answers (e.g. a `to-speculation` document), or failing that the theorem statements in the manuscript itself. If there is no source beyond the manuscript, the Statement axis checks the manuscript against its own abstract and introduction.

### 3. Spawn both sub-agents in parallel

**Rigour sub-agent** brief: "For each proof in scope, walk it line by line. Report: (a) steps that do not follow, with the missing justification named; (b) uses of a result whose hypotheses are not verified at that point; (c) circularity, including lemmas that depend on the theorem being proved; (d) quantifier problems (order swapped, uniform vs pointwise, dependence of constants); (e) unjustified interchanges of limits, sums, integrals, or derivatives; (f) division by possibly-zero quantities, unchecked boundary and degenerate cases; (g) citations used for a statement they do not contain. For each, quote the line and give the smallest example showing the gap is real if you can. Separate **errors** (the step is false) from **gaps** (the step is plausibly true but unproved) from **exposition** (true and proved, but hard to follow). Under 500 words."

**Statement sub-agent** brief: "Compare what is proved with what is claimed. Report: (a) hypotheses stated but never used (the theorem may be stronger, or a use is hidden); (b) hypotheses used but not stated; (c) conclusions weaker than claimed (a constant, a range, an 'almost every' quietly added); (d) claims in the abstract or introduction that the body does not prove; (e) items in the plan or spec that are missing, and work that wasn't asked for. Quote the source line for each. Under 500 words."

Give each sub-agent `NOTATION.md` and the convention records. Where a step is computational, the Rigour sub-agent should check it (SymPy, PARI/GP, SageMath) rather than eyeball it. Where Lean files are in scope, include `lake build` output and `#print axioms` for the main declarations.

### 4. Aggregate

Present under `## Rigour` and `## Statement`, lightly cleaned, not merged or reranked: the axes fail independently. A proof can be flawless and prove the wrong theorem; it can prove exactly the right theorem with a gap on page 7. End with one line per axis: number of findings and the most serious one.

## Referee mode

When the user is refereeing someone else's paper, run the same two axes, then format the result as a report the user edits and sends themselves:

```markdown
**Summary of the paper.** What it claims, in two or three sentences, in your own words.
**Assessment.** Correctness, novelty relative to the literature (verified references only), and significance.
**Major issues.** Errors and gaps, each with location and, where possible, a suggested fix.
**Minor issues.** Exposition, missing references, unclear notation.
**Typos.** By page and line.
```

Novelty claims in a report must rest on references found with the `researxiv` skill, never on recollection. The report is a draft for the user: do not submit it anywhere, and respect the journal's confidentiality, including not uploading the manuscript to services the user hasn't approved.
