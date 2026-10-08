---
name: ask-math
description: Ask which skill or flow fits your situation. A router over the skills in this repo. Use when unsure which skill to run next.
disable-model-invocation: true
---

# Ask Math

Read the user's situation and recommend the skill or sequence of skills that fits, with one line on why. If two fit, say which comes first. If none fits, say so.

The principle behind all of them: the agent does the legwork (computing, searching, checking, formalising, drafting), and the mathematician makes the decisions (what to prove, which definitions, what counts as done, what is interesting). Nothing gets labelled *proved* that isn't, and nothing gets cited that wasn't looked up.

## The main flow: question → result

1. **`/grill-with-white-papers`**: pin down the statement, hypotheses, conventions, and approach, with literature checks running in the background and `NOTATION.md` written as you go. Detours when needed:
   - **`prototoy`**: a quick computation or picture to see whether the conjecture survives, or what the pattern is.
   - **`researxiv`**: is it known? Cited and verified.
2. **`/to-speculation`**: turn the settled conversation into a research spec.
3. **`/to-tikzets`**: cut the spec into lemma tickets with dependency edges.
4. **`/imply-ment`** for one or a few tickets, or **`/implement-spectrum`** for the whole graph in parallel. Both prove check-first through **`sorry-driven-development`** and finish with **`qed-review`**.
5. **`pr-eprint`**: the release: summary, evidence, posting danger, arXiv metadata.

Continue in the same session from grilling into proving when you can: the proof wants the reasoning, not a summary of it.

## On-ramps

- **The effort is too big for one session** (a research programme, a classification, a formula you can't see yet): **`/formula-finder`** charts a map of decision tickets and resolves them one per session.
- **Feedback has arrived** (referee report, error report, coauthor notes): **`/triangulate`**.
- **Something is wrong** (formula vs numerics, two derivations disagree, Lean won't close a goal you believe): **`diagonalizing-bugs`**.

## Project health

- **`/improve-base-change-architecture`**: survey the manuscript or Lean development for lemmas to extract, merge, or generalise.
- **`/deformation-retro`**: after a session, improve the agent's environment (checks, pointers, conventions).

## Vocabulary underneath

- **`domain-of-discourse`**: definitions, notation, conventions, convention records.
- **`codomain-design`**: how to cut a proof into deep lemmas.

## Standalone

- **`/grill-lemma`**: the same interview without writing files. Use it away from a project directory.
- **`epsilon-delta-grilling`**: the interview primitive itself.
- **`/wait-how-much`**: the last message didn't land; re-pitch it with sizes and one real number.
- **`/to-quaternionnaire`**: the answer is in someone else's head; write them the questions (or a MathOverflow draft).
- **`/hand-wave-off`**: hand the session to another agent or a coauthor, with every claim honestly labelled.
- **`/teich-me`**: learn a new area over several sessions.
- **`wizard-of-odes`**: steps only a human can take (arXiv endorsement, logins, tokens).
- **`writing-for-a-gentzen`**: writing `AGENTS.md`, skills, and other agent-facing docs.

## Between phases

At the end of a phase (grilling done, lemma proved, review done), choose: **continue** if the next phase needs this context; **clear** if none of it matters; **`/hand-wave-off`** only if the work is moving to another tool, directory, or person; a **sub-agent** for a tightly scoped job like a literature search or a review; **compact** otherwise. Decide at the boundary, not mid-proof.

## Precondition

**`/setup-math-pocock-skills`**: run once per project to configure the tracker, notation docs, tools, and manuscript paths.
