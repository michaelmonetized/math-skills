#!/usr/bin/env bash
# Wizard template. Helpers above the STAGES marker are shared by every wizard; do not edit them.
set -euo pipefail

ENV_FILE="${ENV_FILE:-.env}"
TOTAL_STAGES=0
CURRENT_STAGE=0
SUMMARY=()

bold() { printf '\033[1m%s\033[0m\n' "$*"; }
info() { printf '  %s\n' "$*"; }

open_url() {
  local url="$1"
  info "Opening: $url"
  if command -v xdg-open >/dev/null 2>&1; then xdg-open "$url" >/dev/null 2>&1 || true
  elif command -v open >/dev/null 2>&1; then open "$url" || true
  elif command -v wslview >/dev/null 2>&1; then wslview "$url" || true
  else info "(Open it in your browser yourself.)"; fi
}

confirm() {
  local prompt="${1:-Done?}" reply
  while true; do
    read -r -p "  $prompt [y/n] " reply
    case "$reply" in y|Y) return 0 ;; n|N) return 1 ;; esac
  done
}

ask() { # ask VAR "Prompt"
  local var="$1" prompt="$2" value
  read -r -p "  $prompt: " value
  printf -v "$var" '%s' "$value"
}

ask_secret() { # ask_secret VAR "Prompt" (input hidden, never echoed)
  local var="$1" prompt="$2" value
  read -r -s -p "  $prompt: " value; echo
  printf -v "$var" '%s' "$value"
}

env_upsert() { # env_upsert KEY VALUE: add or replace KEY in $ENV_FILE
  local key="$1" value="$2" tmp
  touch "$ENV_FILE"
  tmp="$(mktemp)"
  grep -v "^${key}=" "$ENV_FILE" > "$tmp" || true
  printf '%s=%s\n' "$key" "$value" >> "$tmp"
  mv "$tmp" "$ENV_FILE"
  SUMMARY+=("wrote $key to $ENV_FILE")
}

stage() { # stage "Title"
  CURRENT_STAGE=$((CURRENT_STAGE + 1))
  echo
  bold "[$CURRENT_STAGE/$TOTAL_STAGES] $1"
}

finish() {
  echo
  bold "All stages complete."
  for line in "${SUMMARY[@]+"${SUMMARY[@]}"}"; do info "$line"; done
}

# ---------------------------------------------------------------- STAGES ----
# Replace the example below with the real stages. Set TOTAL_STAGES to match.

TOTAL_STAGES=2

stage "Example: link your ORCID iD to your arXiv account"
open_url "https://arxiv.org/user/"
info "Log in, then follow arXiv's instructions for linking an ORCID iD."
confirm "Is your ORCID iD linked?" || { info "Stopping here; re-run when ready."; exit 1; }
SUMMARY+=("ORCID linked on arXiv")

stage "Example: record your ORCID iD for the project"
ask ORCID_ID "Paste your ORCID iD (e.g. 0000-0002-1825-0097)"
env_upsert ORCID_ID "$ORCID_ID"

finish
