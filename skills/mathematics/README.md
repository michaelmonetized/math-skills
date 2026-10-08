# Mathematics

Skills for daily research work: conjectures, proofs, computations, literature, write-ups.

## User-invoked

Reachable only when you type them (Claude Code: `disable-model-invocation: true`; Codex: `policy.allow_implicit_invocation: false` in `agents/openai.yaml`).

- **[ask-math](./ask-math/SKILL.md)**: Which skill fits your situation? A router over this repo.
- **[grill-with-white-papers](./grill-with-white-papers/SKILL.md)**: Grilling session that also checks the literature and writes `NOTATION.md` and convention records as it goes.
- **[triangulate](./triangulate/SKILL.md)**: Split referee reports and error reports into verified items and move them through a state machine.
- **[improve-base-change-architecture](./improve-base-change-architecture/SKILL.md)**: Survey a manuscript or Lean development for lemmas to extract, merge, or generalise; HTML report, then grill.
- **[setup-math-pocock-skills](./setup-math-pocock-skills/SKILL.md)**: Configure tracker, labels, notation docs, installed tools, and manuscript paths. Run once per project.
- **[to-speculation](./to-speculation/SKILL.md)**: Turn the conversation into a research spec: claims with status, conventions, approach, lemma seams, what counts as done.
- **[to-tikzets](./to-tikzets/SKILL.md)**: Cut a plan into lemma tickets with dependency edges, and draw the dependency graph.
- **[imply-ment](./imply-ment/SKILL.md)**: Prove the planned lemmas check-first, then review and commit. Nothing labelled proved that rests on a `sorry`.
- **[implement-spectrum](./implement-spectrum/SKILL.md)**: Work the whole lemma graph on one integration branch, with prover sub-agents across the ready frontier.
- **[formula-finder](./formula-finder/SKILL.md)**: Chart a research effort too big for one session as a map of decision tickets; includes a formula-guessing playbook.
- **[deformation-retro](./deformation-retro/SKILL.md)**: Retrospective on an agent session: what to change in the environment (checks, pointers, conventions), most severe first.

## Model-invoked

Model- or user-reachable (descriptions carry trigger phrasing so the model can reach for them).

- **[prototoy](./prototoy/SKILL.md)**: Throwaway computation or picture that answers one question: does it survive numerics, what is the pattern, what does it look like.
- **[diagonalizing-bugs](./diagonalizing-bugs/SKILL.md)**: Disciplined loop for mathematics gone wrong: build a discrepancy you can run, minimise, hypothesise, instrument, fix, lock in.
- **[researxiv](./researxiv/SKILL.md)**: Literature search against primary sources (arXiv, zbMATH Open, MR Lookup, Crossref, OEIS, MathOverflow), with a no-hallucinated-citations rule.
- **[sorry-driven-development](./sorry-driven-development/SKILL.md)**: Red-green for proofs: state it, check it (small cases, numerics, Lean `sorry`), then prove it. Includes counterexample hunting.
- **[domain-of-discourse](./domain-of-discourse/SKILL.md)**: Pin down definitions, notation, and conventions; maintain `NOTATION.md` and convention records.
- **[codomain-design](./codomain-design/SKILL.md)**: Vocabulary for cutting proofs into deep lemmas: short statements, real leverage, clean cuts.
- **[qed-review](./qed-review/SKILL.md)**: Two-axis proof review (Rigour and Statement) in parallel sub-agents, plus a referee-report mode.
- **[pr-eprint](./pr-eprint/SKILL.md)**: Preprint release shape: summary, evidence, posting danger (arXiv is a one-way door), and arXiv metadata.
- **[wizard-of-odes](./wizard-of-odes/SKILL.md)**: Generate a bash wizard for the steps only a human can take: arXiv endorsement, logins, tokens, portals.
