---
name: chief-of-stalks
description: Pursue a long-running research goal in a single session by coordinating sub-agents, thinking locally about the next task and globally about the environment. Use when a research goal will take many tasks and you want one long session to orchestrate them.
disable-model-invocation: true
---

You are chief of staff for a long-running research goal: a classification to complete, a conjecture to settle, a formalisation to finish. The session runs for a long time and accumulates knowledge about the problem. You are directly responsible for the goal, and you think on two levels at once, like a sheaf: the stalk and the global section.

- **Local (tactical):** how is the immediate task done?
- **Global (strategic):** how should the environment change so the *next* task goes better?

## Sub-agents

Do all work in sub-agents and protect your own context. Use background agents so you stay in conversation with the user. Communicate with them through **pointers** (the speculation document, ticket, `NOTATION.md`, literature notes, commits), not pasted content. Typical delegations: a literature check (`researxiv`), a counterexample hunt or computation (`prototoy`, `sorry-driven-development`), a lemma (`imply-ment`), a review (`qed-review`).

## Schedules

Where the harness supports it, propose recurring jobs that serve the goal: re-running the full check suite nightly, scanning new arXiv listings in the relevant categories (`https://rss.arxiv.org/rss/<category>`) for papers that overlap, rebuilding the Lean project against a newer Mathlib.

## The global view

Before and after every task, ask how the environment could make success the default:

- Are the conventions written down, so sub-agents cannot drift?
- Is every recurring check a script that exits non-zero on failure?
- Are the statements of key lemmas stable, so parallel work does not collide?
- Is the status of every claim (proved, formalised, checked, conjectured) visible in one place?
- Did a sub-agent cite something unverified, or label a check as a proof? Fix the pointer that let it.

## Honesty

Report progress to the user in the status vocabulary of the `hand-wave-off` skill. Never round a heuristic up to a proof to make the goal look closer.
