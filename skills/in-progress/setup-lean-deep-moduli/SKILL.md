---
name: setup-lean-deep-moduli
description: Set up a Lean 4 + Mathlib project so each part of a formalisation is a deep module, with internal lemmas in subfolders reachable only through one entry file, a script that enforces it, and a sorry-free gate on the main theorems. User-invoked. Use when starting or restructuring a Lean formalisation that several agents or people will work on.
disable-model-invocation: true
---

# Setup Lean Deep Moduli

Give a formalisation a shape where each part exposes a few statements (its moduli, the parameters that matter) and hides the rest. Agents working in parallel then depend on stable statements, not on each other's internal lemmas.

## The shape

```
MyProject/
├── lakefile.toml (or lakefile.lean)
├── lean-toolchain
├── MyProject.lean                 # root: imports the entry files only
├── MyProject/
│   ├── Counting.lean              # entry file: public statements of the Counting part
│   ├── Counting/
│   │   └── Internal/*.lean        # lemmas only Counting.lean may import
│   ├── MainTheorem.lean           # imports entry files only
│   └── Checks.lean                # #print axioms for the main theorems
└── scripts/
    ├── check_imports.sh
    └── check_axioms.sh
```

## Steps

### 1. Detect the environment

`elan --version`, `lake --version`, and whether a project already exists (`lakefile.toml`/`lakefile.lean`, `lean-toolchain`). If elan is missing, install it following https://leanprover-community.github.io/get_started.html (the agent can usually run the installer itself; use `wizard-of-odes` only if admin rights are needed).

### 2. Create or reuse the project

New project: `lake new MyProject math` (the `math` template adds Mathlib as a dependency), then `cd MyProject && lake exe cache get` to download prebuilt Mathlib instead of compiling it, then `lake build`.

### 3. Lay out the parts

Ask the user for the parts of the formalisation (usually the sections of the paper or the nodes of the blueprint). For each, create the entry file and an `Internal/` folder. Entry files contain the public statements, proved by importing internal lemmas or stated with `sorry` for now.

### 4. Enforce the boundaries

Write `scripts/check_imports.sh`: for every `.lean` file, every `import MyProject.<Part>.Internal...` line must be in `MyProject/<Part>.lean` or in another file under `MyProject/<Part>/Internal/`. Anything else prints the offending file and line and exits 1. A short `grep -rn '^import' MyProject` pipeline with a loop is enough; keep it readable.

Write `MyProject/Checks.lean` with `#print axioms MyProject.main_theorem` for each main theorem, and `scripts/check_axioms.sh` running `lake env lean MyProject/Checks.lean` and failing if the output mentions `sorryAx`. Until the main theorems are proved, report this check as expected-red rather than skipping it.

### 5. Wire into the checks

Add both scripts and `lake build` to the project's pre-commit config (see `setup-pre-commutative`) or CI.

### 6. Prove the rules bite

Add a forbidden import to `MainTheorem.lean`, confirm `check_imports.sh` fails, revert. Add a `sorry` to a lemma the main theorem uses, confirm `check_axioms.sh` fails, revert.

### 7. Document

Add three lines to `AGENTS.md`: where the parts live, that internal lemmas are private to their part, and that a theorem is not done until `check_axioms.sh` passes for it.
