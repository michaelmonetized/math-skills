---
name: migrate-to-shoe-horner
description: Migrate a LaTeX manuscript from obsolete or fragile idioms ($$...$$, eqnarray, \bf and friends, \over, hard-coded cross-references) to modern amsmath and cleveref usage, one pattern at a time, without changing the mathematics. Use when the user wants to modernise or clean up old LaTeX source, or prepare an old paper for a new version.
---

# Migrate to Shoe-Horner

Evaluate the migration the way Horner evaluates a polynomial: one coefficient at a time, nested, never all at once. Old LaTeX source accumulates idioms that still compile but produce inconsistent spacing, break with modern packages, or make the source hard to edit. This skill replaces them pattern by pattern, verifying after each pass that the mathematics did not change.

## Why bother

The obsolete idioms are catalogued in *l2tabu* ("An essential guide to LaTeX2ε usage", on CTAN as `l2tabu`). The short version: they are plain TeX or LaTeX 2.09 leftovers with worse spacing and fewer guarantees, and modern replacements exist in the kernel or `amsmath`.

## Patterns

| Old | New | Notes |
| --- | --- | --- |
| `$$ ... $$` | `\[ ... \]` or `equation*` | `$$` is plain TeX; spacing is inconsistent and it ignores the `fleqn` option |
| `eqnarray` | `align` (or `align*`) from `amsmath` | `eqnarray` puts extra space around the relation symbol |
| `{\bf x}`, `{\it x}`, `{\rm x}` | `\textbf{x}`, `\emph{x}` or `\textit{x}`, `\textrm{x}`; in math `\mathbf`, `\mathit`, `\mathrm` | the two-letter font commands are obsolete |
| `a \over b` | `\frac{a}{b}` | |
| `\centerline{...}` | `\centering` or a `center` environment | |
| "Theorem 3", "(2.1)" typed by hand | `\label` + `\cref` (cleveref) or `\ref`/`\eqref` | hard-coded numbers go stale |
| repeated long notation | `\newcommand` macros defined once in the preamble | prefer `\newcommand` to `\def`, which overwrites silently |

## Workflow

1. **Baseline.** Compile the untouched source (`latexmk -pdf main.tex`), keep the PDF as `baseline.pdf`, and commit.
2. **Inventory.** Count occurrences of each pattern (`grep -c` per file) and show the user the table. Let them choose which patterns to migrate.
3. **One pattern per pass.** Replace one pattern across the source, recompile, and check: no new errors or warnings (especially undefined references), and the PDF still says the same thing. Run `latexdiff` between the old and new `.tex` if the change is not purely cosmetic, and visually compare the pages that changed. Commit each pattern separately.
4. **Never touch the mathematics.** No re-indexing, no notation changes, no "improving" a formula along the way. If you spot an error, note it for the user instead (it is a `triangulate` item, not a migration step).
5. **Finish.** Report the patterns migrated, the counts, and anything skipped (e.g. an `eqnarray` that relies on its specific layout).
