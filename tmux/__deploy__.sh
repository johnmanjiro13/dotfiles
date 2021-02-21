#!/bin/bash

mkdir -p ~/.tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf "$DOTPATH"/tmux/tmux.conf ~/.tmux.conf
ln -sf "$DOTPATH"/tmux/gitmux.conf ~/.tmux/gitmux.conf

ln -sf "$DOTPATH"/tmux/sh/wifi.sh /usr/local/bin/wifi
ln -sf "$DOTPATH"/tmux/sh/battery.sh /usr/local/bin/battery
ln -sf "$DOTPATH"/tmux/sh/pane-border.sh /usr/local/bin/pane-border
