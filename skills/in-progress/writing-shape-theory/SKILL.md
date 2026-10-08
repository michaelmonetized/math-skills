---
name: writing-shape-theory
description: "Mathematical writing, exploit: shape raw material into an exposition, paragraph by paragraph, arguing each structural choice. Use when you have a pile of raw material and want it turned into a paper introduction, survey, or article."
disable-model-invocation: true
---

The user passes a Markdown file of raw material (fragments from `writing-fractals`, notes, a transcript). Read all of it first. Then build a separate document from it, paragraph by paragraph. The raw file is read-only. If no output path was given, ask once.

## The loop

1. **Read the pile** end to end.
2. **Fix the reader.** Settle with the user who reads this and what they already know (a specialist, a mathematician in a neighbouring field, a graduate student, a general audience). Those concepts are **grounded**. Everything else must be grounded in the text before anything leans on it.
3. **Draft 2 or 3 openings**, each implying a different angle: lead with the problem's history, with the motivating example, or with the main theorem. The user picks or merges.
4. **Grow one block at a time.** Ask "given what's written, what does the reader need next?" Pull from the pile. Argue the form: prose, a displayed theorem, an example environment, a table of known results, a figure, a remark. Each choice should be defensible.
5. **Append each agreed block** to the output file immediately, as LaTeX or Markdown per the user's choice.
6. Repeat until the user says it's done.

## Grounding

A definition, notation, or idea is usable only after it has been introduced. The unit is the concept, not the symbol: an argument can lean on an idea the reader lacks with no new notation in sight. When a block needs something ungrounded, ground it first or reorder.

## Mathematical shape

- State the main result early, precisely, in a displayed theorem, then explain it.
- Examples before generality, and one non-example per hypothesis where space allows.
- Every reference cited must be verified (`researxiv`); fragments marked `[verify]` get checked before they are used.
- Keep proofs out of an introduction; sketch the idea and point to the section.
