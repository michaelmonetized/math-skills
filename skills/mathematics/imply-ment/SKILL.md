---
name: imply-ment
description: "Carry out a piece of mathematical work described in a speculation document or a set of lemma tickets: state, check, prove, and review. Use when the plan is settled and it is time to prove one or a few lemmas."
disable-model-invocation: true
---

Carry out the work the user points to: a `to-speculation` document, one or more lemma tickets, or a plan in the conversation.

If the user passes a ticket reference, fetch it from the tracker and state its title before starting. If the reference is ambiguous, ask.

Call the Skill tool with "sorry-driven-development" and work lemma by lemma at the agreed seams: statement, check, proof.

Keep the feedback tight as you go: recompile the manuscript after each lemma (`latexmk -pdf <main>.tex`, read the warnings for undefined references and citations), rebuild the affected Lean files after each change, and re-run the project's checks under `scripts/` or `checks/` at the end.

When the work is done, call the Skill tool with "qed-review" on it, and fix what it finds (or report what you could not fix).

Commit to the current branch with a message that names the results proved and the checks added. Never mark something proved in the commit message, the manuscript, or the tracker if it still rests on a `sorry`, a heuristic step, or a numerical check alone.
