# alias
alias bat='bat --style="header,numbers,grid"'
alias ls='eza --git'
alias lsa='eza -a --git'
alias ll='eza -ahl --git'
alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache"'

# abbr
abbr -a bd cd ..
abbr -a rm rm -i
abbr -a cp cp -i
abbr -a mv mv -i
abbr -a chez chezmoi
abbr -a relogin exec $SHELL -l
abbr -a ga git add
abbr -a gb git branch
abbr -a gcm git commit
abbr -a gcma git commit --amend
abbr -a gcmf git commit --fixup
abbr -a gf git fetch
abbr -a gs git switch
abbr -a gr git restore
abbr -a grb git rebase
abbr -a gst git status
abbr -a gl git l
abbr -a gpl git pull
abbr -a k kubectl
abbr -a kx kubectx
abbr -a kn kubens
abbr -a d docker
abbr -a dc docker compose
abbr -a mysql mycli
abbr -a sed gsed
abbr -a k9sr k9s --readonly
