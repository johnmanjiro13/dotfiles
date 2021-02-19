#!/bin/bash

set -e

DOTPATH="$HOME"/dev/src/github.com/johnmanjiro13/dotfiles; export DOTPATH
DOTFILES_GITHUB="https://github.com/johnmanjiro13/dotfiles.git"; export DOTFILES_GITHUB

function download_dotfiles () {
  if [ ! -d "$DOTPATH" ]; then
    git clone "$DOTFILES_GITHUB" "$DOTPATH"
  fi
}

function deploy_dotfiles () {
  . "$DOTPATH"/etc/deploy.sh
}

function initialize () {
  . "$DOTPATH"/etc/initialize.sh
}

function main() {
  if [ -x "$(which curl)" ] && [ -x "$(which git)" ]; then
    download_dotfiles && deploy_dotfiles && initialize
  else
    echo "Please install dependencies: ('git', 'curl')"
    exit 1
  fi
}

main
