---
name: prototoy
description: Build a throwaway computation or picture to answer one mathematical question. Use when the user wants to see whether a conjecture survives numerics, find the pattern in small cases, guess the order of growth, or see what an object or function actually looks like before proving anything.
---

# Prototoy

A prototoy is **throwaway code that answers one question** about the mathematics. The question decides its shape.

## Pick a branch

- **"Is this true / what is the pattern / how fast does it grow?"** → [EXPERIMENT.md](EXPERIMENT.md). A script that computes the relevant quantity over a range of cases and prints a table.
- **"What does it look like?"** → [PICTURE.md](PICTURE.md). A script that renders the object (plot, phase portrait, fundamental domain, graph drawing, heat map of a matrix) in a few variants.

If ambiguous and the user is away, pick the experiment and say so at the top of the script.

## Rules for both

1. **Throwaway, and labelled as such.** Put it in `scratch/` (or the project's existing scratch convention) with a `proto-` prefix and a header comment stating the question.
2. **One command to run.** `python scratch/proto-x.py`, `sage scratch/proto-x.sage`, `gp -q scratch/proto-x.gp`. No setup steps.
3. **Exact where it matters.** Integers, rationals, and finite fields before floats; if floats, state the precision.
4. **Show the evidence, not just the verdict.** Print the table or save the figure, plus the range covered and the runtime.
5. **Estimate before you run.** If the search space is large, estimate it first (the `wait-how-much` reference) and pick a range that finishes in minutes.
6. **Capture the answer.** Record the question, the verdict, the range, and the script path in the project notes or the relevant issue. Keep the script on a branch or in `scratch/`; promote it to `scripts/` only if it becomes a permanent check.

A prototoy answers a question; it is never evidence of a proof. Label what it shows as **Checked (range)**.
