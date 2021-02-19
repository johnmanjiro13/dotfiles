#!/bin/bash

PLATFORM=$(uname); readonly PLATFORM

function install_homebrew() {
  if [ $PLATFORM = "Darwin" ]; then
    if [ ! which brew &> /dev/null ]; then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
  fi
}

DARWIN="${DOTPATH}/packages/darwin.txt"; readonly DARWIN

if [ $PLATFORM = "Darwin" ]; then
  install_homebrew
  for package in `cat "$DARWIN"`; do
    brew install "$package"
  done
else
  echo "Only Darwin is supported"
  exit 1
fi
