#!/usr/bin/env sh
set -eu
cd -- "$(dirname -- "$0")"
if command -v xdg-open >/dev/null 2>&1; then
  xdg-open ./crumble.html
elif command -v gio >/dev/null 2>&1; then
  gio open ./crumble.html
else
  printf '%s\n' 'Open crumble.html in a modern web browser.' >&2
  exit 1
fi
