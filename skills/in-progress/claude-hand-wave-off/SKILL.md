---
name: claude-hand-wave-off
description: Hand the current session to a fresh background Claude Code agent that continues immediately, seeded with an honestly labelled handoff note. Use when work should continue right away in a new Claude Code background session.
argument-hint: "What will the next session be used for?"
disable-model-invocation: true
---

Write a handoff note exactly as the `hand-wave-off` skill describes (status ledger with every claim labelled, dead ends, conventions, verified references only, suggested skills, secrets redacted), and save it to the OS temp directory.

Then launch a background Claude Code session seeded with it as the prompt:

```bash
claude --bg "$(cat <path-to-note>)"
```

It starts in the current directory and returns immediately; the user manages it with `claude agents`. Tell the user the note's path and how to find the session.

Because the note becomes the new agent's prompt, it must stand alone: the precise statements, the pointers, and what the next session is for (from the user's argument, if given). Do not duplicate what files and commits already hold; point to them.
