---
name: to-tikzets
description: Break a speculation, proof plan, or conversation into lemma tickets, each declaring which other tickets it depends on, published to the configured tracker, with the dependency graph drawn for the user. Use after to-speculation, or whenever a proof plan needs to be split into session-sized pieces.
disable-model-invocation: true
---

# To TikZets

Break the plan into **tickets**, each one a lemma (or computation, or formalisation step) that can be finished in one session, each declaring the tickets that **block** it.

The tracker should have been configured; if not, tell the user to run `/setup-math-pocock-skills`.

## Process

### 1. Gather context

Work from the conversation. If the user passes a speculation document or issue, read it in full, including comments.

### 2. Read the project (optional)

Read the manuscript, `NOTATION.md`, and any Lean files so ticket titles use the project's terms. Look for **prefactoring**: a definition or general lemma that, if set up first, makes several later tickets easy. "Make the proof easy, then write the easy proof."

### 3. Draft vertical slices

<slice-rules>

- Each ticket delivers one complete, checkable piece: a statement, its check (small cases or numerics), and its proof, and in a formalising project, its Lean statement and proof. Not "write all the statements" or "do all the numerics".
- A finished ticket is verifiable on its own: the check passes, the proof is written, `lake build` is green for that file.
- Each ticket fits in one fresh session.
- Prefactoring tickets come first.

</slice-rules>

Give each ticket its **blocked-by** edges: the lemmas its proof uses. A ticket with no blockers can start at once.

**Wide changes are the exception.** Changing a convention used everywhere (a normalisation, an indexing shift) cannot be sliced vertically. Sequence it as expand–contract: introduce the new form beside the old (a new macro, a bridging lemma relating the two normalisations), migrate sections or files in batches, each batch its own ticket, then remove the old form in a final ticket blocked by all batches.

### 4. Quiz the user

Show the tickets as a numbered list (title, blocked-by, what it delivers) and draw the dependency graph: a Mermaid `graph TD` block in chat, and, if the user wants it in the paper or notes, a TikZ picture or Graphviz `dot` file. If the project uses a Lean blueprint, show the `\uses{...}` lines each ticket implies. Ask:

- Is the granularity right?
- Are the dependency edges right (no lemma secretly using a later one)?
- Should any tickets be merged or split?

Iterate until the user approves.

### 5. Publish

Create the tickets in dependency order (blockers first, so edges can reference real ids), using the tracker's native blocking links where available, and the `ready-for-agent` label unless the user says otherwise. For a local tracker, write one file per ticket:

```markdown
# <NN>: <Ticket title>

## Parent
<link to the speculation or plan>

## What to deliver
<the statement in display math, the check to write, and the proof or formalisation expected>

## Acceptance criteria
- [ ] Check passes (range or precision stated)
- [ ] Proof written in <file>, every step justified
- [ ] (if formalising) `lake build` passes; no `sorry` in <declaration>

## Blocked by
<ticket links, or "None">
```
