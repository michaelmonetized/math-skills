---
name: writing-bettis
description: "Mathematical writing, exploit: assemble raw material into a talk or exposition as a sequence of beats, choosing each next beat from the current one, grounding every concept before a beat leans on it. Use when building a talk, lecture, or expository piece from existing raw material."
disable-model-invocation: true
---

The user passes a Markdown file of raw material. This is **exploit**: the pile is fixed; choose a path through it, one **beat** at a time. Count the holes as you go: every beat should either close a question the reader has or open one worth closing. If no output path was given, ask once.

1. **Fix the audience** and what they already know (the grounded concepts). For a talk, also fix the length: a 50-minute seminar holds far fewer beats than a paper.
2. **Offer 2 or 3 starting beats** from the pile, each a different way in (a puzzle, an example, a picture, the theorem). Note what each grounds and preview what it unlocks. The user picks.
3. **Write only that beat** to the output file. A beat may be one sentence (or one slide) or several paragraphs.
4. **Re-read the file**, then offer 2 or 3 next beats reachable from what is now grounded. Repeat until the piece reaches a natural end.

## What is a beat

One move the audience feels: a question raised, an example that surprises, a definition that resolves a tension, a theorem that answers the question, a proof idea, a payoff. Beats that only add information without moving the audience are notes, not beats.

## Rules

- A beat may use only grounded concepts and must say which new ones it grounds.
- The main theorem should arrive while the audience still remembers why they wanted it.
- References in any beat must be verified with `researxiv`.
