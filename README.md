# Skills For Real Mathematicians

My agent skills for doing real mathematics, not vibe proving.

> **Parody notice.** This is a parody of, and is inspired by, [mattpocock/skills](https://github.com/mattpocock/skills) ("Skills for Real Engineers") by Matt Pocock, used under its MIT License. Same skeleton, same workflow shapes, every skill renamed with a pun and rewritten from scratch for research mathematics. Not affiliated with or endorsed by Matt Pocock. If you write software, go use the real thing.

## Your February 2026 moment, delivered in October

In February 2026, software engineers looked up from their terminals and asked what, exactly, they were for now. Mathematicians watched over their coffee and said "well, proofs are different."

Then the models got good at olympiad problems. Then at lemmas. Then at the lemma you were saving for the summer.

So: what is the mathematician for? Roughly what the senior engineer turned out to be for. **You decide what is true, what is interesting, and what counts as done.** The agent does the legwork: small cases, counterexample hunts, literature searches, Lean boilerplate, LaTeX, and checking everything twice. These skills encode that division of labour, plus the three rules that keep it honest:

1. Nothing is labelled *proved* that isn't. ("Checked for 0 ≤ n ≤ 39" is not proved: ask Euler's n² + n + 41, which is prime for all of those and composite at n = 40.)
2. Nothing is cited that wasn't looked up this session, with an arXiv id, DOI, zbMATH Open id, or MR number.
3. Every tool named in these skills exists. No invented tactics, no imaginary databases, no papers by Professor Hallucinatus.

The names are puns. The skills are not jokes.

## All the skills

| Original (mattpocock/skills) | Math version | What it does |
| --- | --- | --- |
| `ask-matt` | [`ask-math`](./skills/mathematics/ask-math/SKILL.md) | Which skill fits your situation? A router over this repo. |
| `grill-with-docs` | [`grill-with-white-papers`](./skills/mathematics/grill-with-white-papers/SKILL.md) | Grilling session that also checks the literature and writes `NOTATION.md` and convention records as it goes. |
| `triage` | [`triangulate`](./skills/mathematics/triangulate/SKILL.md) | Split referee reports and error reports into verified items and move them through a state machine. |
| `improve-codebase-architecture` | [`improve-base-change-architecture`](./skills/mathematics/improve-base-change-architecture/SKILL.md) | Survey a manuscript or Lean development for lemmas to extract, merge, or generalise; HTML report, then grill. |
| `setup-matt-pocock-skills` | [`setup-math-pocock-skills`](./skills/mathematics/setup-math-pocock-skills/SKILL.md) | Configure tracker, labels, notation docs, installed tools, and manuscript paths. Run once per project. |
| `to-spec` | [`to-speculation`](./skills/mathematics/to-speculation/SKILL.md) | Turn the conversation into a research spec: claims with status, conventions, approach, lemma seams, what counts as done. |
| `to-tickets` | [`to-tikzets`](./skills/mathematics/to-tikzets/SKILL.md) | Cut a plan into lemma tickets with dependency edges, and draw the dependency graph. |
| `implement` | [`imply-ment`](./skills/mathematics/imply-ment/SKILL.md) | Prove the planned lemmas check-first, then review and commit. Nothing labelled proved that rests on a `sorry`. |
| `implement-spec` | [`implement-spectrum`](./skills/mathematics/implement-spectrum/SKILL.md) | Work the whole lemma graph on one integration branch, with prover sub-agents across the ready frontier. |
| `wayfinder` | [`formula-finder`](./skills/mathematics/formula-finder/SKILL.md) | Chart a research effort too big for one session as a map of decision tickets; includes a formula-guessing playbook. |
| `retro` | [`deformation-retro`](./skills/mathematics/deformation-retro/SKILL.md) | Retrospective on an agent session: what to change in the environment (checks, pointers, conventions), most severe first. |
| `prototype` | [`prototoy`](./skills/mathematics/prototoy/SKILL.md) | Throwaway computation or picture that answers one question: does it survive numerics, what is the pattern, what does it look like. |
| `diagnosing-bugs` | [`diagonalizing-bugs`](./skills/mathematics/diagonalizing-bugs/SKILL.md) | Disciplined loop for mathematics gone wrong: build a discrepancy you can run, minimise, hypothesise, instrument, fix, lock in. |
| `research` | [`researxiv`](./skills/mathematics/researxiv/SKILL.md) | Literature search against primary sources (arXiv, zbMATH Open, MR Lookup, Crossref, OEIS, MathOverflow), with a no-hallucinated-citations rule. |
| `tdd` | [`sorry-driven-development`](./skills/mathematics/sorry-driven-development/SKILL.md) | Red-green for proofs: state it, check it (small cases, numerics, Lean `sorry`), then prove it. Includes counterexample hunting. |
| `domain-modeling` | [`domain-of-discourse`](./skills/mathematics/domain-of-discourse/SKILL.md) | Pin down definitions, notation, and conventions; maintain `NOTATION.md` and convention records. |
| `codebase-design` | [`codomain-design`](./skills/mathematics/codomain-design/SKILL.md) | Vocabulary for cutting proofs into deep lemmas: short statements, real leverage, clean cuts. |
| `code-review` | [`qed-review`](./skills/mathematics/qed-review/SKILL.md) | Two-axis proof review (Rigour and Statement) in parallel sub-agents, plus a referee-report mode. |
| `pr` | [`pr-eprint`](./skills/mathematics/pr-eprint/SKILL.md) | Preprint release shape: summary, evidence, posting danger (arXiv is a one-way door), and arXiv metadata. |
| `wizard` | [`wizard-of-odes`](./skills/mathematics/wizard-of-odes/SKILL.md) | Generate a bash wizard for the steps only a human can take: arXiv endorsement, logins, tokens, portals. |
| `grill-me` | [`grill-lemma`](./skills/productivity/grill-lemma/SKILL.md) | The same relentless interview, saving nothing. Out of the dilemma, into the lemma. |
| `handoff` | [`hand-wave-off`](./skills/productivity/hand-wave-off/SKILL.md) | Hand off to another agent or coauthor, every claim labelled proved, formalised, checked, heuristic, conjectured, or refuted. |
| `teach` | [`teich-me`](./skills/productivity/teich-me/SKILL.md) | Learn a new area over several sessions, with a stateful workspace, verified resources, exercises, and spaced recall. |
| `to-questionnaire` | [`to-quaternionnaire`](./skills/productivity/to-quaternionnaire/SKILL.md) | Write the questions for the one expert who knows (or a MathOverflow draft), after doing the literature homework. |
| `wait-what` | [`wait-how-much`](./skills/productivity/wait-how-much/SKILL.md) | That didn't land: re-pitch it in plain words with one concrete instance, sizes, constants, and a feasibility estimate. |
| `grilling` | [`epsilon-delta-grilling`](./skills/productivity/epsilon-delta-grilling/SKILL.md) | The interview primitive: statement, conventions, each hypothesis, edge cases, novelty, what counts as done. |
| `writing-for-agents` | [`writing-for-a-gentzen`](./skills/productivity/writing-for-a-gentzen/SKILL.md) | Writing `AGENTS.md`, skills, and agent-facing docs for a maths project. |
| `git-guardrails-claude-code` | [`git-guardrails-cauchy-code`](./skills/misc/git-guardrails-cauchy-code/SKILL.md) | Claude Code hook that blocks history-rewriting git commands in a shared paper repo. |
| `migrate-to-shoehorn` | [`migrate-to-shoe-horner`](./skills/misc/migrate-to-shoe-horner/SKILL.md) | Modernise old LaTeX (`$$`, `eqnarray`, `\bf`, `\over`) one idiom at a time without touching the mathematics. |
| `scaffold-exercises` | [`sheaffold-exercises`](./skills/misc/sheaffold-exercises/SKILL.md) | Scaffold problem sheets with hints and solutions that compile with or without answers. |
| `setup-pre-commit` | [`setup-pre-commutative`](./skills/misc/setup-pre-commutative/SKILL.md) | Pre-commit hooks that compile the paper, catch undefined refs and citations, build Lean, and run numerical checks. |
| `chief-of-staff` | [`chief-of-stalks`](./skills/in-progress/chief-of-stalks/SKILL.md) | Run a long research goal through sub-agents, thinking locally (the task) and globally (the environment). |
| `claude-handoff` | [`claude-hand-wave-off`](./skills/in-progress/claude-hand-wave-off/SKILL.md) | `hand-wave-off`, then launch a background Claude Code session seeded with the note. |
| `loop-me` | [`loop-space`](./skills/in-progress/loop-space/SKILL.md) | Grill out specs for the recurring loops of research life: arXiv monitoring, refereeing, seminars. |
| `setup-ts-deep-modules` | [`setup-lean-deep-moduli`](./skills/in-progress/setup-lean-deep-moduli/SKILL.md) | Lean 4 + Mathlib project with enforced module boundaries and a sorry-free gate on the main theorems. |
| `writing-beats` | [`writing-bettis`](./skills/in-progress/writing-bettis/SKILL.md) | Build a talk or exposition one beat at a time, grounding each concept before it is used. |
| `writing-fragments` | [`writing-fractals`](./skills/in-progress/writing-fractals/SKILL.md) | Mine raw fragments of exposition: the one-line reason, the motivating example, the leading word. |
| `writing-shape` | [`writing-shape-theory`](./skills/in-progress/writing-shape-theory/SKILL.md) | Shape raw material into exposition, block by block, arguing each structural choice. |

`mathematics/` and `productivity/` ship in the plugin. `misc/` and `in-progress/` are installable one at a time. User-invoked skills (the orchestrators) run only when you type them, e.g. `/grill-with-white-papers`; model-invoked skills can also be picked up by the agent when the task fits.

## Installation (30-second setup)

> This repository has not been pushed anywhere yet. The commands below assume it lives at `github.com/michaelmonetized/math-skills`; until then, use the local option at the end.

A plugin updates itself; skills.sh copies editable files you update by hand. Pick one per agent, or you get every skill twice.

<details>
<summary><strong>Claude Code</strong></summary>

```bash
claude plugin marketplace add michaelmonetized/math-skills
claude plugin install math-pocock-skills@mathpocock
```

</details>

<details>
<summary><strong>Codex</strong></summary>

```bash
codex plugin marketplace add michaelmonetized/math-skills
codex plugin add math-pocock-skills@mathpocock
```

</details>

<details>
<summary><strong>GitHub Copilot</strong> (CLI and VS Code)</summary>

```bash
copilot plugin marketplace add michaelmonetized/math-skills
copilot plugin install math-pocock-skills@mathpocock
```

In VS Code, run **Chat: Install Plugin From Source** and enter `https://github.com/michaelmonetized/math-skills`.

</details>

<details>
<summary><strong>Gemini CLI</strong> (manual updates)</summary>

```bash
gemini skills install https://github.com/michaelmonetized/math-skills.git --path skills/mathematics
gemini skills install https://github.com/michaelmonetized/math-skills.git --path skills/productivity
```

</details>

<details>
<summary><strong>Any other agent, or editable files</strong> (manual updates)</summary>

```bash
npx skills@latest add michaelmonetized/math-skills -a <agent>  # cursor, opencode, windsurf, amp, ...
```

Include `setup-math-pocock-skills` when asked which skills to take.

</details>

<details>
<summary><strong>Local clone</strong> (works today)</summary>

```bash
git clone <this repo> math-skills && cd math-skills
scripts/link-skills.sh   # symlinks skills into ~/.claude/skills and ~/.agents/skills
```

</details>

Then, once per project, run **`/setup-math-pocock-skills`**: it finds your manuscript, bibliography, and installed tools (SageMath, PARI/GP, SymPy, GAP, Macaulay2, Lean 4), and asks where notation, tickets, and literature notes should live. Bam: ready to be grilled.

## Why these skills exist

**#1: The agent proved something, just not the thing you meant.** Quantifiers swapped, ℕ started at 1, "positive" meant ≥ 0. Fix: `/grill-with-white-papers` (or `/grill-lemma` away from a project) interrogates the statement, every hypothesis, and the edge cases before anyone proves anything, and writes the conventions down in `NOTATION.md`.

**#2: The agent cited a paper that does not exist.** Fix: `researxiv` searches arXiv, zbMATH Open, MR Lookup, Crossref, the OEIS, and MathOverflow, quotes statements from the source, and refuses to cite anything it did not look up.

**#3: The proof doesn't work.** Fix: `sorry-driven-development` puts a check that can fail (small cases, exact numerics, a Lean statement with `sorry`) in front of every lemma, and hunts counterexamples before proofs. When it still goes wrong, `diagonalizing-bugs` finds where.

**#4: You built a ball of lemmas.** Forty shallow lemmas, each used once. Fix: `codomain-design` for the vocabulary of deep lemmas, and `/improve-base-change-architecture` to survey the mess.

Not sure where to start? `/ask-math`.

## Credits and license

- Original: [mattpocock/skills](https://github.com/mattpocock/skills) by Matt Pocock (MIT). Structure, skill boundaries, and workflow shapes are echoed from it; all text here is new.
- The `pr-eprint` skill's Summary / Evidence / Danger shape descends from the original's `pr` skill, which credits Dex Horthy's [show-me](https://github.com/humanlayer/skills/blob/main/plugins/show-me/skills/show-me/SKILL.md).
- Math version: Michael C. Hurley. MIT, see [LICENSE](./LICENSE), which carries both copyright notices.
