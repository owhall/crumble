#!/usr/bin/env sh
set -eu
cd -- "$(dirname -- "$0")"
if command -v xdg-open >/dev/null 2>&1; then
  xdg-open ./index.html
elif command -v gio >/dev/null 2>&1; then
  gio open ./index.html
else
  printf '%s\n' 'Open index.html in a modern web browser.' >&2
  exit 1
fi
