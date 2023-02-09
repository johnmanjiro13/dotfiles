function __git_branch_fzf
  set branch (git branch | sed -e "s/^.* //g" | fzf --reverse --preview "git l --color=always")
  echo $branch
  if test -n "$branch"
    git switch $branch
  end
  commandline -f repaint
end
