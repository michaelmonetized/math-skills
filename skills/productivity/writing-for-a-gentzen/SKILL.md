---
name: writing-for-a-gentzen
description: Writing documents for agents working on mathematics. Use when creating or editing skills, or writing AGENTS.md, CLAUDE.md, NOTATION.md, or any project doc an agent reaches by a pointer.
---

Reference for writing the documents an agent consumes in a mathematics project: skills, `AGENTS.md`/`CLAUDE.md`, and the docs they point at. Like a sequent calculus, every rule should be explicit, small, and mechanically applicable.

## Pointers decide behaviour

A line in `AGENTS.md` naming a document, or a skill's `description`, is a **pointer**: it says what the material is and when to reach for it. The wording of the pointer, not the material behind it, decides whether the agent ever reads it.

- Lead with the trigger: "Before introducing new notation, read `NOTATION.md`" beats "`NOTATION.md` contains notation".
- One trigger per genuinely different case. Synonyms are one case written twice.
- Always-loaded text costs attention on every turn. Keep `AGENTS.md` to pointers and hard rules.

## What a maths project's AGENTS.md should hold

Short, and mostly pointers:

```markdown
# Agent notes
- Main manuscript: `paper/main.tex`; build with `latexmk -pdf paper/main.tex`.
- Notation and conventions: read `NOTATION.md` before writing any formula.
- Convention decisions: `docs/conventions/`.
- Computations: `scripts/`; SageMath and PARI/GP are installed; run `scripts/check_all.sh` after changing any formula.
- Lean: `lean/`; build with `lake build`; never leave `sorry` in a declaration you report as done.
- References: never cite from memory. Every citation needs an arXiv id, DOI, zbMATH Open id, or MR number that you looked up this session.
```

## Rules that earn their place

Write a rule into an always-loaded file only when the agent demonstrably gets it wrong without it. For mathematics the recurring ones are: citations from memory, silent convention changes (normalisations, indexing from 0 or 1), unlabelled heuristics presented as proofs, and floating-point "verification" of exact identities. Everything else goes behind a pointer.

## Steps and reference

A document holds **steps** (ordered actions) and **reference** (definitions, rules, tables). Keep steps at the top of the file. Push reference that only some cases need into a sibling file behind a pointer; inline what every case needs.

## Skill mechanics

- Frontmatter: `name` (matches the folder), `description` (what it is and when to trigger), optional `argument-hint`.
- `disable-model-invocation: true` makes a skill user-invoked only; for Codex, mirror it with `policy.allow_implicit_invocation: false` in `agents/openai.yaml`.
- A user-invoked skill may call model-invoked skills ("Call the Skill tool with ..."), never another user-invoked one.
- Every tool, command, tactic, and database you name must be one you have checked exists. An agent following a skill will try to run what it says.
