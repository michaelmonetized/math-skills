---
name: hand-wave-off
description: Compact the current session into a handoff note for another agent or a coauthor, with every claim labelled by how well it is actually established. Use when moving work to another tool, directory, agent, or coauthor.
argument-hint: "What will the next session be used for?"
disable-model-invocation: true
---

Write a handoff note so a fresh agent (or a coauthor) can continue the work without re-deriving anything and without inheriting any hand-waving. Save it to the OS temp directory (`$TMPDIR`, else `/tmp`; `%TEMP%` on Windows), not the project directory, and report the path.

## Contents

1. **Goal.** The statement being proved, refuted, computed, or written up, in its current precise form. If the user passed an argument, it describes what the next session is for: tailor everything to that.
2. **Status ledger.** One line per claim that matters, each with exactly one label:
   - **Proved**: where the proof lives (file and label, e.g. `paper.tex`, `lem:key-bound`).
   - **Formalised**: the Lean declaration name, and that `#print axioms` on it shows no `sorryAx`.
   - **Checked**: what was checked, by which script, over which range ("n ≤ 40, exact arithmetic, `scratch/check_bound.py`").
   - **Heuristic**: the argument exists but has a named gap. Name the gap.
   - **Conjectured**: believed, with the evidence for it.
   - **Refuted**: the counterexample, and the script that verifies it.
   Never upgrade a label in the summary. "We basically have it" is not a label.
3. **Dead ends.** Approaches tried and why each failed, one line each, so the next session does not repeat them.
4. **Conventions in force.** Point to `NOTATION.md` and convention records; list only conventions that are not written down yet.
5. **References.** Only references that were verified this session (arXiv id, DOI, zbMATH or MR number). Anything recalled but unverified goes in a separate "to verify" list.
6. **Suggested skills.** Which skills the next agent should call the Skill tool for, and why (e.g. "sorry-driven-development: Lemma 3 has a statement and a numerical check but no proof").

Point to existing artefacts (manuscript, scripts, Lean files, issues, commits) by path or URL instead of restating them. Redact secrets, credentials, and anything personal about referees or third parties.
