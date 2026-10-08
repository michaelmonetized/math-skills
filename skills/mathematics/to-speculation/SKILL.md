---
name: to-speculation
description: "Turn the current conversation into a precise research specification (statements, conventions, known results, approach, lemma seams, what counts as done) and publish it to the project tracker: no interview, just synthesis. Use when grilling is done and the plan should be written down."
disable-model-invocation: true
---

Take what has been discussed and what is in the project, and write it up as a **speculation**: a research spec precise enough that someone else (or an agent) could work from it. Do not interview the user; synthesise what you already know. Mark anything unsettled as an open question rather than inventing an answer.

The tracker and labels should have been configured; if not, tell the user to run `/setup-math-pocock-skills`.

## Process

1. Read the project: the manuscript, `NOTATION.md`, convention records, literature notes. Use the project's notation throughout.
2. Sketch the **seams**: the lemma statements the main argument will be cut into, preferring existing lemmas and as few cuts as the argument allows (call the Skill tool with "codomain-design" for the vocabulary). Check with the user that these cuts match their intent. This is the only question you ask.
3. Write the speculation with the template below and publish it to the tracker with the `ready-for-agent` label (or save it to the project's specs directory if the tracker is local Markdown).

<speculation-template>

## Problem

The question, in a paragraph, from the mathematician's point of view: why it matters and what is currently missing.

## Main claims

Each in display math, each labelled with exactly one status:
- **Conjecture**: believed, with the evidence (ranges checked, heuristics).
- **Target theorem**: what this effort intends to prove.
- **Known**: proved elsewhere, with a verified reference (arXiv id, DOI, zbMATH Open id, or MR number).

## Definitions and conventions

Pointers to `NOTATION.md` and convention records, plus anything new this effort introduces.

## Approach

The proof strategy in prose: the key idea, the hardest step, and why it should work. Alternatives considered and why they were set aside.

## Lemma seams

The intermediate statements, each with what it is used for. No proofs here.

## Verification decisions

What will be checked and how: small cases to what range, numerical checks at what precision, which statements will be formalised in Lean, and what counts as done (written proof, proof reviewed with qed-review, formalised with no `sorry`).

## Out of scope

Generalisations, sharper constants, and related questions deliberately excluded.

## Further notes

Open questions, risks, and the most likely failure mode.

</speculation-template>

Do not include proofs or long computations: point to the files that hold them. Where a prototoy produced a table or formula that pins a claim down better than prose, include the decisive part and say it came from an experiment, with its range.
