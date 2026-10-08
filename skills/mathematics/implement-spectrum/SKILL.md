---
name: implement-spectrum
description: "Work an entire speculation document and its lemma tickets as a dependency graph on one integration branch, running prover sub-agents across the ready frontier in parallel. Use when a spec has many lemma tickets that can be worked in parallel."
disable-model-invocation: true
---

You have a speculation document (from `/to-speculation`) with lemma tickets (from `/to-tikzets`). The goal is every ticket resolved on one **integration branch**, with the main results proved (and formalised, if the speculation asked for it).

The tracker should have been configured; if not, tell the user to run `/setup-math-pocock-skills`.

The tickets form a **dependency graph**: a lemma can start when every lemma it uses is done. The **frontier** is the set of tickets whose dependencies are all done. This is the same graph a Lean blueprint (leanblueprint, with `\uses{...}`) draws, and if the project has a blueprint, keep it in sync.

Talk to sub-agents through **pointers** (the speculation document, ticket, `NOTATION.md`, earlier commits), not by pasting their contents.

## Steps

1. Read the speculation and the tickets; reconstruct the dependency graph and show the user the initial frontier.
2. (Optional) Run an **exploration sub-agent** for anything several tickets need: the relevant Mathlib API (via Loogle and LeanSearch), the precise statements of cited results (via `researxiv`). It saves notes outside the repo where all later sub-agents can read them.
3. Create the integration branch.
4. For each frontier ticket, start a **prover sub-agent** in its own git worktree and branch, in the background where the harness allows. Each one:
   - confirms its worktree is based on the integration branch;
   - calls the Skill tool with "sorry-driven-development" to state, check, and prove its lemma (statement in Lean with `sorry` first, if the project formalises);
   - must not change the statement of any lemma it depends on; if a dependency's statement is wrong or too weak, it stops and reports instead;
   - merges the integration branch tip into its branch before reporting done.
5. When a prover finishes, merge its branch into the integration branch with a **merger sub-agent** that rebuilds the manuscript and the Lean project and re-runs the checks.
6. Recompute the frontier and start provers for newly unblocked tickets.
7. When every ticket is done, call the Skill tool with "qed-review" on the integration branch. Fix its findings with one more prover sub-agent.
8. Report the integration branch, the status of every result (proved, formalised, checked), and anything still open. Resolve tickets the way the tracker closes work. Do not push or open pull requests unless the user asks.
9. Remove the sub-agent worktrees.

## When a lemma turns out false

A prover that finds a counterexample to its own lemma reports it with the verification script and stops. Pause the lemmas that depend on it, show the user the counterexample, and go back to `/to-speculation` or `/grill-with-white-papers` to repair the plan. Never weaken a statement silently to make the graph go green.
