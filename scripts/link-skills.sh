#!/usr/bin/env bash
# Symlink every skill (except misc/ and deprecated/) into the local skill
# directories used by agent harnesses, so `git pull` keeps them current:
#   ~/.claude/skills  (Claude Code)
#   ~/.agents/skills  (Codex and other Agent Skills-compatible harnesses)
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

mapfile -d '' SKILL_FILES < <(find "$REPO/skills" -name SKILL.md -not -path '*/deprecated/*' -not -path '*/misc/*' -print0)

for DEST in "${DESTS[@]}"; do
  if [ -L "$DEST" ]; then
    case "$(readlink -f "$DEST")" in
      "$REPO"|"$REPO"/*) echo "error: $DEST points into this repo; remove it and re-run." >&2; exit 1 ;;
    esac
  fi
  mkdir -p "$DEST"
  for f in "${SKILL_FILES[@]}"; do
    src="$(dirname "$f")"
    name="$(basename "$src")"
    target="$DEST/$name"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "skip $name: $target exists and is not a symlink" >&2
      continue
    fi
    ln -sfn "$src" "$target"
    echo "linked $name -> $src ($DEST)"
  done
done
