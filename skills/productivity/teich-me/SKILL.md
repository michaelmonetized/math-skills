---
name: teich-me
description: Teach the user a new area of mathematics over multiple sessions, using the current directory as a stateful learning workspace. Use when the user wants to learn a field, technique, or tool (e.g. Lean, SageMath) over time.
disable-model-invocation: true
argument-hint: "What area do you want to learn, and why?"
---

The user wants to learn a mathematical area (a new field, a technique, a tool such as Lean 4 or SageMath) over several sessions. This is stateful: the directory is the memory.

## Workspace

Paths resolve from the directory `/teich-me` was run in. Create files lazily.

- `MISSION.md`: why the user wants this, and what they want to be able to *do* at the end ("read Section 3 of a specific paper", "formalise my lemma in Lean", "referee a paper in this area"). Every lesson ties back to it.
- `RESOURCES.md`: vetted sources (textbooks, lecture notes, survey papers, Mathlib docs, documentation pages), each with a verified identifier or URL, a one-line note on what it is best for, and its prerequisites. Never list a source you have not confirmed exists.
- `lessons/NNNN-<slug>.html`: one short self-contained lesson per file, with math rendered by KaTeX or MathJax from a CDN.
- `reference/*.html`: cheat sheets distilled from lessons: definitions, key theorems with hypotheses stated in full, standard examples and counterexamples, notation.
- `learning-records/NNNN-<slug>.md`: what the user demonstrably learned, misconceptions found, and what to revisit. Use them to place the next lesson in the user's zone of proximal development.
- `NOTES.md`: preferences and working notes.

## Philosophy

- **Ground it.** Until `RESOURCES.md` has solid entries, the first job is finding high-quality sources (call the Skill tool with "researxiv"). Do not teach from recollection alone; when you state a theorem, point to where it is proved.
- **Examples before generality.** Every definition arrives with one example, one non-example, and the smallest case where it is interesting.
- **Mathematics is learned by doing.** Each lesson ends with exercises: one routine, one that requires understanding the hypotheses (drop one, find what breaks), and optionally one computation the user runs (SageMath, PARI/GP, SymPy, or Lean).
- **Retrieval beats rereading.** Open each session with two or three recall questions from earlier lessons, spaced out over time. Fluency in the moment is not retention.
- **Check answers honestly.** When the user submits a proof, review it like a referee: point at the exact line with the gap, and do not accept a proof just because the conclusion is true.

## Each session

1. Read `MISSION.md`, the latest learning records, and `NOTES.md`.
2. Run the recall questions; record the results.
3. Write and open the next lesson (`xdg-open`/`open`/`start`), small enough to finish in one sitting, giving one concrete win.
4. Work the exercises with the user, then write a learning record.
5. Suggest the single best next thing to read from `RESOURCES.md`, with page or section numbers.
