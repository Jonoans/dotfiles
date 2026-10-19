#!/bin/bash
set -euo pipefail

# usage: log.sh <phase> <decision> <reason> <reference> <result>
# appends one row to .audit/decisions/log.tsv in the working directory
# set LOG_FILE to write somewhere else

if [ "$#" -ne 5 ]; then
  echo "usage: $0 <phase> <decision> <reason> <reference> <result>" >&2
  exit 1
fi

template="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/template.tsv"
log="${LOG_FILE:-.audit/decisions/log.tsv}"

# setup: create the log from the template on first use
if [ ! -f "$log" ]; then
  mkdir -p "$(dirname "$log")"
  cp "$template" "$log"
  if [ -z "${LOG_FILE:-}" ] && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    grep -qxF '.audit' .gitignore 2>/dev/null || echo '.audit' >>.gitignore
  fi
fi

# tabs and newlines would break the row
clean() { printf '%s' "$1" | tr '\t\n\r' '   '; }

printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
  "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$1" "$(clean "$2")" "$(clean "$3")" "$(clean "$4")" "$(clean "$5")" >>"$log"
