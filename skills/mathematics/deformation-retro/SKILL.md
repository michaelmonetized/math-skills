---
name: deformation-retro
description: "Conduct a retrospective on an agent session in a mathematics project and suggest improvements to the agent's environment, most severe first. Use after a session where the agent struggled, made avoidable mistakes, or cited badly."
disable-model-invocation: true
---

The user wants a **retrospective**: not on the mathematics, but on the environment the agent worked in, so the next session goes better. Shrink the session down to the few things that matter, continuously, without tearing anything.

## Steps

1. Call the Skill tool with "writing-for-a-gentzen" for the style guide for agent-facing documents.
2. Read the primary sources for the session the user names (session logs on this machine, the commits, the files touched). Default to the current session.
3. Look for candidates in these categories:

- **Navigation.** Did the agent struggle to find the main `.tex` file, the definitions, the scripts, or the Lean declarations? Would a pointer in `AGENTS.md` or a section map in `NOTATION.md` have helped? *Use when* the session spent long stretches searching.
- **Automated checks.** Did the agent introduce something a check would have caught: a broken build, an undefined reference, a formula changed without its numerical check re-run, a `sorry` left behind? Look at what already exists (a `Makefile`, `scripts/check_all.sh`, CI, pre-commit hooks) first: an existing check nobody runs is the finding. A project with no automated compile or check at all is itself a finding (see the `setup-pre-commutative` skill). *Use when* the agent made a mistake a script could have caught.
- **Review standards.** Should `qed-review` be told about a recurring problem (an interchange of limits this field always gets wrong, a convention the agent keeps flipping)? Mechanical problems get a check; judgement calls get a line in a `REVIEW_STANDARDS.md` read during review. *Use when* review missed something.
- **Citations.** Did the agent cite anything from memory, or get a reference detail wrong? If so, strengthen the citation rule's pointer and make sure the literature tools are reachable. *Use when* any reference was unverified.
- **Conventions.** Did a convention drift (normalisation, indexing, sign)? Is it in `NOTATION.md` or a convention record? *Use when* the same symbol meant two things.
- **Tool economy.** Expensive or slow tool use: rebuilding all of Mathlib instead of `lake exe cache get`, enumerations that could have been estimated first, repeated literature searches that should have been saved to notes. *Use when* a step took far longer than it needed to.
- **Information access.** Was something crucial unavailable: SageMath not installed, no access to a paper behind a paywall, no way to see the compiled PDF? *Use when* the agent guessed instead of looking.
- **Steering bloat.** Instructions in `AGENTS.md` that did not change behaviour. *Use when* steering files are long.

4. Present the candidates to the user, most severe first, each with the concrete change you propose (the exact line to add, the script to write). Change nothing until the user picks.

## Implementation vs review

The proving agent carries the most context pressure: it explores, computes, and writes. The reviewing agent receives a finished proof or diff. Put standards (exposition style, rigour checklists, convention enforcement) on the review side, not in the always-loaded files the proving agent reads.
