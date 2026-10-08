---
name: formula-finder
description: Plan a research effort too big for one session (a closed form to find, a theorem to prove, a classification to complete) as a shared map of decision tickets on the issue tracker, and resolve them one at a time until the way to the destination is clear. Use when a question is too big or too foggy for one session.
disable-model-invocation: true
---

A loose research idea has arrived: "there should be a closed form for this", "this bound ought to extend to all p", "can we classify these?". It is too big for one session and the route is foggy. This skill does not charge at the answer. It charts the way as a **map** on the project's issue tracker, then resolves **decision tickets** (questions whose answers are decisions or facts, not chunks of proof to grind out) one per session, until the route is clear.

The tracker should have been configured by `/setup-math-pocock-skills`; if not, tell the user to run it, and meanwhile default to local Markdown files under `.scratch/formula-finder/`.

## Plan, don't prove

By default each ticket settles a question ("which normalisation?", "is the generating function D-finite?", "does the known proof for p = 2 use anything special to 2?"). The map is finished when nothing remains to decide before someone sits down and proves or computes the thing. The urge to start proving is usually the sign you have reached the edge of the map: hand off to `/to-speculation`. An effort can override this in its Notes.

## Refer by name

Every map and ticket is an issue with a title. In everything the user reads, refer to tickets by title (linked), never by bare number.

## The map

One issue labelled `formula-finder:map`. Its tickets are child issues (or, on a tracker without sub-issues, issues that link the map). The map is an **index**: each decision lives in exactly one ticket; the map gists it and links.

```markdown
## Destination
<what the end looks like: "a proven closed form for a(n)", "a decision on whether to pursue approach A or B", "a complete list with proof of completeness". One or two lines.>

## Notes
<area, conventions in force (link NOTATION.md), skills every session should use, preferences>

## Decisions so far
- [<closed ticket title>](link): <one-line gist of the answer>

## Not yet specified
<foggy questions you can see coming but cannot state precisely yet>

## Out of scope
<work deliberately excluded from this effort, with the reason>
```

## Tickets

Each ticket body is one question, sized to one session:

```markdown
## Question
<the decision or investigation this ticket resolves>
```

Each carries one label `formula-finder:<type>`:

- **literature** (agent alone): is it known, what exactly does source X prove, how do others normalise it? Resolved by a sub-agent using the `researxiv` skill.
- **experiment** (agent alone or with user): compute, tabulate, plot, or guess. Uses the `prototoy` skill; for guessing closed forms and recurrences, follow [GUESSING.md](GUESSING.md).
- **grilling** (with the user): a conversation that settles a choice. Call the Skill tool for "epsilon-delta-grilling" and "domain-of-discourse". The agent never answers the user's side.
- **task** (either): work that must happen before a decision can be made: installing SageMath or a Lean toolchain, getting data from a collaborator, running a long computation.

Blocking uses the tracker's native dependency links where they exist (they render the frontier in the tracker's UI). A session **claims** a ticket by assigning it before starting. The **frontier** is the set of open, unblocked, unclaimed tickets. Record each answer as a closing comment on its ticket, link any scripts or notes it produced, then add the gist to the map's Decisions so far.

## Fog of war

Do not ticket what you cannot yet state precisely. If you can phrase the question sharply, it is a ticket (even if blocked). If not, it goes in **Not yet specified**. Each resolved ticket clears some fog: graduate whatever is now sharp into new tickets.

Out-of-scope work never graduates. If an existing ticket turns out to lie beyond the destination, close it and add one line to **Out of scope**.

## Invocation

Never resolve more than one ticket per session, except literature tickets, which can run in parallel.

### Chart the map

1. **Name the destination** with the user (grilling plus domain-of-discourse). It fixes the scope.
2. **Map the frontier**: grill breadth-first across the whole effort to surface the open questions takeable now. If there is no fog (the whole thing fits in one session), say so and ask how the user wants to proceed instead.
3. **Create the map issue and the first tickets**, with blocking links, and show the user the frontier.

### Work through the map

1. Load the map, list the frontier, and let the user pick (or recommend one).
2. Claim it, resolve it with the skill its type names, record the answer, update the map, graduate any fog.
3. Stop. One ticket per session.
