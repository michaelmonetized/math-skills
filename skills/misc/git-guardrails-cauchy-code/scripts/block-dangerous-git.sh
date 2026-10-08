#!/usr/bin/env bash
# Claude Code PreToolUse hook: refuse destructive git commands.
# Reads the hook payload (JSON) on stdin. Exit 2 blocks the call and shows stderr to the agent.
set -euo pipefail

PATTERNS=(
  'git[[:space:]]+push'
  'git[[:space:]]+reset[[:space:]]+.*--hard'
  'git[[:space:]]+clean[[:space:]]+.*-[a-zA-Z]*f'
  'git[[:space:]]+branch[[:space:]]+.*-D'
  'git[[:space:]]+checkout[[:space:]]+(--[[:space:]]+)?\.([[:space:]]|$)'
  'git[[:space:]]+checkout[[:space:]]+--[[:space:]]'
  'git[[:space:]]+restore'
  'git[[:space:]]+rebase'
  'git[[:space:]]+commit[[:space:]]+.*--amend'
)

cmd="$(jq -r '.tool_input.command // empty')"
[ -z "$cmd" ] && exit 0

for p in "${PATTERNS[@]}"; do
  if printf '%s' "$cmd" | grep -Eq "$p"; then
    echo "Blocked by git guardrails: '$cmd' can discard or rewrite shared work in this repo. Ask the user to run it themselves if it is really intended." >&2
    exit 2
  fi
done
exit 0
