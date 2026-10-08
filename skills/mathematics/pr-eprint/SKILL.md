---
name: pr-eprint
description: "The shape of a preprint release: arXiv title, abstract, and comments, a short announcement of the results, the evidence that they hold, and a posting-danger call. Use when preparing an arXiv submission or new version, writing a results announcement for colleagues, or writing the description of a pull request to a paper or Lean repository."
metadata:
  credits:
    note: "Summary / Evidence / Danger structure echoes the pr skill in mattpocock/skills, which credits Dex Horthy's show-me skill"
    url: "https://github.com/humanlayer/skills/blob/main/plugins/show-me/skills/show-me/SKILL.md"
---

Use this template. Write it to `release-notes/<version>.md` (or the project's equivalent) for the user to review; never submit or post anything yourself.

```markdown
## Summary
<the main theorem(s), stated precisely in display math, plus one line on what is new compared to the best previous result (with a verified reference)>

## Evidence
- **Proofs:** <where each main result is proved; which parts were refereed by whom, if anyone, or reviewed with qed-review>
- **Checks:** <numerical or computational checks, with ranges and script paths>
- **Formalisation:** <Lean declarations, if any, and whether they are sorry-free>

## Posting Danger
**Door:** <one-way or two-way>
**Blast radius:** <one word>
<what happens if a result is wrong, overlaps with existing work, or is announced prematurely>

## arXiv metadata
- **Title:** <no TeX macros beyond simple math>
- **Abstract:** <plain text, ≤ 1920 characters>
- **Comments:** <pages, figures; for v2+, what changed>
- **Primary category / cross-lists:** <e.g. math.NT; math.CO>
- **MSC2020:** <codes, verified at https://zbmath.org/classification/>
```

## Sections

### Summary

The smallest thing that makes the result clear: the theorem as stated in the paper, then a one-line comparison with the prior state of the art ("improves the exponent from 1/4 to 1/3"; "removes the assumption that G is abelian"). If a diagram is clearer (a dependency graph of the main lemmas, a table of bounds old vs new), use it. For a new arXiv version, show what changed as a short diff of statements.

### Evidence

Be specific and honest. "Proved" means a complete written proof exists. "Checked to n ≤ 10^6" is evidence, not proof. "Formalised" means `lake build` passes and `#print axioms` on the main theorem shows no `sorryAx`. Never list a reference you have not verified (see the `researxiv` skill).

### Posting Danger

An arXiv posting is a **one-way door**: every version stays publicly available permanently, and withdrawing a paper adds a new version rather than deleting the old ones. A journal submission is closer to two-way until acceptance. A wrong claimed proof of a well-known problem has a large blast radius; a minor correction has a small one. Name the specific risks: an error in a key lemma, overlap with a recent preprint, a coauthor who has not signed off, a missing acknowledgement or funding line.

### arXiv practicalities

- The abstract field takes plain text with simple TeX math rendered by MathJax; expand custom macros. Abstracts over 1920 characters are rejected.
- arXiv distributes the LaTeX source, including comments. Strip comments and unused files before uploading; `arxiv_latex_cleaner` (a Google research tool installable with pip) automates this. Look at what you are about to publish.
- Compile from a clean copy of the upload to check that every file, figure, and `.bbl` is included.
- First-time submitters to a category may need an endorsement; that is a human step (see the `wizard-of-odes` skill).

### For a pull request instead

Same three sections: Summary (what statements or definitions changed, as a short diff), Evidence (build output, checks), Danger (what downstream files or results depend on the change).
