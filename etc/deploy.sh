#!/bin/bash

if [ -z "$DOTPATH" ]; then
  echo "err: $DOTPATH not found"
  exit 1
fi

for dirname in $(find "$DOTPATH" -not -path '*/\.*' -mindepth 1 -maxdepth 1 -type d); do
  f="$dirname"/__deploy__.sh
  if [ -f "$f" ]; then
    if [ -x "$f" ]; then
      . "$dirname"/__deploy__.sh
    else
      echo "permission denied: $f"
      exit 1
    fi
  fi
done
