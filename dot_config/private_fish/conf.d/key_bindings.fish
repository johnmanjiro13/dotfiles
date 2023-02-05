bind \cg\cg '__ghq_repository_search'
if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \cg\cg '__ghq_repository_search'
end

bind \cg\cb 'gh branch'

fzf_configure_bindings --git_log=\cg\cl --git_status=\cg\cs --process=\cp
