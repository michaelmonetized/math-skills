---
name: to-quaternionnaire
description: Turn a mathematical question you can't settle alone into a questionnaire for the one expert, coauthor, or community who can. Use when the missing piece is in a specific person's head, or the user wants a MathOverflow question drafted.
disable-model-invocation: true
---

Some blockers are not in your head or in the literature you can find: they are in a specialist's head ("is this lemma folklore?", "does the method of X extend to non-compact Y?", "which normalisation does your group use?"). This skill writes the document you send them. It does not send anything.

**Grill the send, not the mathematics.** Ask the user only what they can always answer: who it goes to and what they need back. The questions in the document aim at the **gap** between what the recipient knows and what the user needs.

## Steps

1. **Who is it for?** In one exchange: the recipient's area, how well they know the user, and the channel (private email to a specialist, a coauthor, a seminar audience, or a public MathOverflow question). Done when you know what they know that the user doesn't.
2. **What do you need back?** In one exchange: the specific facts or judgements the user cannot get alone. Done when you have a short concrete list.
3. **Do the homework first.** Before writing, run a literature check (call the Skill tool with "researxiv") so the document does not ask anything a search would answer, and so it can say "I found X and Y; neither seems to cover Z". Busy experts answer questions that show this.
4. **Write it** to `to-quaternionnaire-<slug>.md` in the current directory and report the path. Done when every item from step 2 is covered.

## Document shape

```markdown
# <Title>

**Purpose:** the decision or result riding on the answers.
**From:** <user>  **To:** <recipient>

## Setting
One paragraph, with the precise statement in display math, definitions for anything non-standard, and the conventions in force.

## What I already know
Verified references (arXiv id / DOI / zbMATH or MR number) and what each does and does not cover. What I tried and where it stopped.

## Questions
Most important first. One idea per question, with space to answer under it.
A one-line "why this matters" only where the question could be misread.

### Is <statement> known, or a special case of something known?
>

## Anything else?
"Is there something I should have asked?"
```

## If the recipient is MathOverflow

Write it as a single question rather than a questionnaire: a precise title that is itself a question, the motivation in two or three sentences, the exact statement, what you tried, and what you found in the literature. One question per post. Check that it is research-level; if it is not, say that Mathematics Stack Exchange is the better venue. The user posts it, not the agent.
