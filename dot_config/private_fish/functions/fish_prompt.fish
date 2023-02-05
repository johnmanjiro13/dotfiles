function kube_status
    [ -z "$KUBECTL_PROMPT_ICON" ]; and set -l KUBECTL_PROMPT_ICON "⎈"
    [ -z "$KUBECTL_PROMPT_SEPARATOR" ]; and set -l KUBECTL_PROMPT_SEPARATOR ":"
    set -l config $KUBECONFIG
    [ -z "$config"]; and set -l config "$HOME/.kube/config"
    if [ ! -f $config ]
        echo (set_color red)$KUBECTL_PROMPT_ICON" "(set_color white)"no config"
        return
    end

    set -l ctx (kubectl config current-context 2>/dev/null)
    if [ $status -ne 0 ]
        echo (set_color red)$KUBECTL_PROMPT_ICON" "(set_color white)"no context"
        return
    end

    set -l ns (kubectl config view -o "jsonpath={.contexts[?(@.name==\"$ctx\")].context.namespace}")
    [ -z $ns ]; and set -l ns 'default'

    echo (set_color cyan)$KUBECTL_PROMPT_ICON" "(set_color white)"("(set_color red)$ctx(set_color white)$KUBECTL_PROMPT_SEPARATOR(set_color cyan)$ns(set_color white)")"
end

function fish_prompt
    echo -n (kube_status)' '
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color blue)(prompt_pwd)' '

    set_color -o
    if fish_is_root_user
        echo -n (set_color red)'# '
    end

    echo -n (__git_status)' '
    echo -n (set_color green)'» '

    set_color normal
end
