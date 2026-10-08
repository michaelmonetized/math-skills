---
name: git-guardrails-cauchy-code
description: Set up Claude Code hooks that block destructive git commands (push, force-push, reset --hard, clean, branch -D, checkout/restore of the working tree) in a paper or research repo. Use when the user wants to protect a manuscript repo, an Overleaf-synced repo, or coauthors' work from an agent's git commands.
---

# Git Guardrails (Cauchy Code)

A paper repo is shared state: coauthors push to it, Overleaf may sync with it, and a force-push or `reset --hard` can silently discard someone's afternoon of proofreading. This skill installs a Claude Code `PreToolUse` hook that refuses those commands before they run, so the sequence of commits stays Cauchy: nothing jumps.

## What gets blocked

- `git push` (all forms, including `--force` and `--force-with-lease`)
- `git reset --hard`
- `git clean -f` and variants
- `git branch -D`
- `git checkout .` / `git checkout -- <path>` and `git restore` on the working tree
- `git rebase` and `git commit --amend` (they rewrite history coauthors may already have)

The agent can still commit, branch, diff, and log. The user runs blocked commands themselves.

## Steps

### 1. Ask the scope

This project only (`.claude/settings.json`, recommended for a shared paper repo) or every project (`~/.claude/settings.json`)?

### 2. Install the script

Copy [scripts/block-dangerous-git.sh](scripts/block-dangerous-git.sh) to `.claude/hooks/block-dangerous-git.sh` (project) or `~/.claude/hooks/block-dangerous-git.sh` (global), and `chmod +x` it. It needs `jq`; check with `command -v jq`.

### 3. Register the hook

Merge this into the chosen settings file without overwriting existing hooks:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          { "type": "command", "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/block-dangerous-git.sh" }
        ]
      }
    ]
  }
}
```

For the global install, use the absolute path to `~/.claude/hooks/block-dangerous-git.sh` instead.

### 4. Customise

Ask whether to allow anything on the list (some users want `git push` to a personal branch) or add anything (e.g. `rm -rf` on the `paper/` directory). Edit the pattern list at the top of the script.

### 5. Verify

Pipe a fake hook payload through the script and check it exits 2 with a message:

```bash
echo '{"tool_input":{"command":"git push --force origin main"}}' | .claude/hooks/block-dangerous-git.sh; echo "exit=$?"
echo '{"tool_input":{"command":"git status"}}' | .claude/hooks/block-dangerous-git.sh; echo "exit=$?"
```

The first should print the refusal and `exit=2`; the second `exit=0`.
