---
name: setup-math-pocock-skills
description: "Configure this project for the mathematics skills: tracker, triage labels, where notation and convention records live, which computational tools are installed, and where the manuscript and bibliography are. Run once before first use of the other mathematics skills."
disable-model-invocation: true
---

# Setup Math Pocock's Skills

Write the per-project configuration the other skills assume. This is prompt-driven: explore, present what you found, confirm with the user, then write.

## 1. Explore

Read what exists; assume nothing.

- **Version control**: `git remote -v`. Is this a GitHub repo, an Overleaf project synced through git, or local only?
- **Agent files**: `AGENTS.md`, `CLAUDE.md`, and whether either already has an `## Agent skills` section.
- **Manuscript**: the main `.tex` file (look for `\documentclass`), the bibliography (`.bib`), and the build command (a `latexmkrc`, a `Makefile`).
- **Notation**: `NOTATION.md`, `docs/conventions/`.
- **Tracker hints**: `.scratch/` (local Markdown tracker in use), GitHub issues enabled.
- **Tools**, each with a quick version check: `sage --version`, `gp --version`, `python3 -c "import sympy, mpmath"`, `gap` (`gap -q` then `quit;`), `M2 --version` (Macaulay2), `magma` (licensed, rarely present), `lean --version`, `lake --version`, `latexmk -v`, `chktex --version`.
- **Lean project**: a `lakefile.lean` or `lakefile.toml`, `lean-toolchain`, a Mathlib dependency.

## 2. Present findings and ask

Summarise what is present and missing, then go section by section, leading each with a recommended answer the user can accept in one word. Skip any section exploration already settled.

- **A. Tracker.** Where research questions and lemma tickets live: GitHub issues (via `gh`), local Markdown under `.scratch/`, or something the user describes. For a solo project with no remote, recommend local Markdown.
- **B. Triage labels** (only if `triangulate` is installed): the label strings for `error`, `gap`, `exposition`, `literature`, `extension` and for the five states. Recommend using the canonical names as-is.
- **C. Docs layout.** Where `NOTATION.md`, convention records, literature notes (`notes/literature/`), and scratch computations (`scratch/`) go.
- **D. Tools.** Confirm which installed tools the agent may use for checks, and which missing ones the user wants installed (and whether you may install them, or they will: see `wizard-of-odes`).

## 3. Confirm and write

Show the exact text you will write, then:

- Add an `## Agent skills` section to `AGENTS.md` (or `CLAUDE.md` if that is what the project uses; create `AGENTS.md` if neither exists) containing only pointers: the tracker, the label mapping, the docs layout, the manuscript and build command, the tools available, and the citation rule ("never cite from memory; every reference needs an identifier looked up this session").
- Write the longer details to `docs/agents/tracker.md`, `docs/agents/triage-labels.md`, and `docs/agents/tools.md`, and point to them.

## 4. Done

Tell the user what was written, and suggest a first step: `/grill-with-white-papers` on the current question, or `/ask-math` if they are unsure.
