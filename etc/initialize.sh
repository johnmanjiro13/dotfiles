#!/bin/bash

PLATFORM=$(uname); export PLATFORM

install_homebrew() {
  if [ $PLATFORM = "Darwin" ]; then
    if [ ! which brew &> /dev/null ]; then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
  fi
}

REQUIREMENTS="${DOTPATH}/packages/requirements.txt"
DARWIN="${DOTPATH}/packages/darwin.txt"

if [ $PLATFORM = "Darwin" ]; then
  install_homebrew
  for package in `cat "$REQUIREMENTS"`; do
    brew install "$package"
  done
  for package in `cat "$DARWIN"`; do
    brew install "$package"
  done
else
  echo "Only Darwin is supported"
  exit 1
fi
