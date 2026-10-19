#!/bin/bash
set -euo pipefail

# links each skill and agent in the repo's .agents into ~/.agents, then ~/.claude
repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link_all() {
  local kind="$1" item name dest target
  for target in "$HOME/.agents/$kind" "$HOME/.claude/$kind"; do
    mkdir -p "$target"
    for item in "$repo/.agents/$kind"/*; do
      [ -e "$item" ] || continue
      name="$(basename "$item")"
      dest="$target/$name"
      if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "skip $dest (exists and is not a symlink)"
        continue
      fi
      ln -sfn "$item" "$dest"
      echo "linked $dest"
    done
  done
}

link_all skills
link_all agents
