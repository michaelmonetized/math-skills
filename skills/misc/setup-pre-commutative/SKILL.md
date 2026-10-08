---
name: setup-pre-commutative
description: Set up pre-commit hooks for a paper or research repo that compile the LaTeX, flag undefined references and citations, lint with chktex, build the Lean project, and run the numerical checks. Use when the user wants commit-time checks, a guardrail for agents editing the manuscript, or "pre-commit" in a maths repo.
---

# Setup Pre-Commutative

Make "commit" and "check" commute: nothing gets committed that does not compile and pass its checks. Uses the `pre-commit` framework (https://pre-commit.com) with local hooks, so no third-party hook repositories are needed.

## What this sets up

- **Compile**: `latexmk` builds the main document and fails on errors.
- **References**: a check that the log has no undefined references or citations.
- **Lint** (optional): `chktex` on changed `.tex` files.
- **Lean** (if present): `lake build`.
- **Numerical checks** (if present): the project's check script, e.g. `scripts/check_all.sh`.

## Steps

1. **Detect.** Main `.tex` file, whether `latexmk`, `chktex`, `lake` exist, and whether a check script exists. Ask the user which hooks they want; compile and references are the recommended minimum.
2. **Install pre-commit**: `pipx install pre-commit` (or `pip install pre-commit`), then confirm with `pre-commit --version`.
3. **Write `.pre-commit-config.yaml`** with only the hooks chosen:

```yaml
repos:
  - repo: local
    hooks:
      - id: latex-compile
        name: compile manuscript
        entry: latexmk -pdf -interaction=nonstopmode -halt-on-error paper/main.tex
        language: system
        pass_filenames: false
        files: \.(tex|bib|sty|cls)$
      - id: latex-undefined
        name: no undefined references or citations
        entry: bash -c '! grep -E "(Reference|Citation).*undefined" paper/main.log'
        language: system
        pass_filenames: false
        files: \.(tex|bib)$
      - id: chktex
        name: chktex
        entry: chktex -q
        language: system
        files: \.tex$
      - id: lean-build
        name: lake build
        entry: bash -c 'cd lean && lake build'
        language: system
        pass_filenames: false
        files: \.lean$
      - id: numerical-checks
        name: numerical checks
        entry: scripts/check_all.sh
        language: system
        pass_filenames: false
        files: \.(py|sage|gp|tex)$
```

Adjust paths to the project. If `latexmk` writes its output elsewhere (an `-outdir`), point the log check there.

4. **Install the hook**: `pre-commit install`.
5. **Verify**: `pre-commit run --all-files`. Then prove it bites: introduce an undefined `\ref{nope}` in a scratch copy, confirm the hook fails, and revert.
6. **Commit** the config with a message saying which checks now run, and add a line to `AGENTS.md` pointing to it.

## Notes

- A full LaTeX compile on every commit can be slow for long papers; if it takes more than a few seconds, offer to limit it to commits touching the manuscript (the `files:` patterns above already do this).
- `chktex` is noisy on some styles; tune it with a `.chktexrc` rather than disabling it, or drop it.
