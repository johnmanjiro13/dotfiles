set -x LANG ja_JP.UTF-8
set -x CLICOLOR 1

# fish
set -x GHQ_SELECTOR_OPTS --reverse

# PATH
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.local/bin $PATH

# XDG
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

# go
if [ (command -v go ) ]
  set -x GOPATH $HOME/go
  set -x PATH $GOPATH/bin $PATH
end

# anyenv
if [ (command -v anyenv) ]
  set -x ANYENV_DEFINITION_ROOT $XDG_CONFIG_HOME/anyenv/anyenv-install
  eval (anyenv init - | source)
end

# docker
set -x DOCKER_BUILDKIT 1

# Homebrew
set -x HOMEBREW_NO_AUTO_UPDATE 1
if [ (command arch) = "arm64" ]
  set -x PATH /opt/homebrew/bin $PATH
end

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# bookmark
mkdir -p $HOME/.bookmarks
set -x CDPATH . $HOME/.bookmarks
