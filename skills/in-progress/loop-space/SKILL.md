---
name: loop-space
description: Grill me into specs for the recurring workflows of my research life (arXiv monitoring, refereeing, seminar prep, problem sheets), within this workspace. Use when you want to delegate a recurring part of research life and need its workflow specified first.
disable-model-invocation: true
argument-hint: "A recurring task to specify, or nothing to go find one"
---

Run a stateful grilling session (call the Skill tool with "epsilon-delta-grilling") whose only output is **workflow specs**. Create, edit, and delete specs as answers settle.

## The loop lens

A **loop** is something that recurs: the morning arXiv listing, a weekly seminar, a referee request, marking problem sheets, the annual grant report. The space of a mathematician's loops is where delegation pays off. Use the lens to find loops worth specifying, and propose ones the user hasn't noticed.

A **workflow** is the spec of one loop. Workflows live in `workflows/*.md` and are the source of truth.

## Vocabulary

Use only where a workflow needs it; mandate nothing.

- **Trigger**: what starts a run: an event (a referee invitation arrives) or a schedule (every weekday morning, when the new listings are out; arXiv provides RSS feeds per category at `https://rss.arxiv.org/rss/<category>`).
- **Checkpoint**: where the user must verify or decide. Push it as late as possible and do maximal preparation first.
- **Brief**: what the user sees at a checkpoint: a short, decision-ready summary with links down to the source, never the raw dump. "Three new papers overlap with your project; one claims your Lemma 3 in greater generality (link, Theorem 2.1)."
- **Hard lines**: what the workflow must never do without the user, e.g. accept or decline a referee request, email an editor, post anything.

## Definition of done

A workflow spec is done when someone could implement it without asking a single question.

## The workspace

- `workflows/*.md`: one spec per workflow.
- `NOTES.md`: the user's world: their arXiv categories, journals they referee for, seminars, tools, and their own names for things. If it is thin, interview them about their world before specifying anything.
