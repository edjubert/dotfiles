if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-interactive
    and not set -q TMUX
    set PATH "/home/edjubert/.local/share/fnm" $PATH
    fnm env --use-on-cd | source
end

set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin:$GOROOT/bin:$PATH

set -gx GRAFANA $HOME/workspace/axens/connectin-grafana
set -gx CONNECTIN $HOME/workspace/axens/connectin

fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs

set fish_greeting
