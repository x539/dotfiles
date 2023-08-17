alias ls='ls --color=auto'
alias ll='ls --color=auto -lZ'
alias ip='ip -color=auto'
alias dc='docker compose'
alias dr='docker compose run --rm'
alias g='git'
alias sudo='sudo '


if command -v kubectl >/dev/null 2>&1; then
	source <(kubectl completion bash)
	alias k=kubectl
	alias kctx='kubectl config use-context'
	alias kns='kubectl config set-context --current --namespace'
	complete -F __start_kubectl k
fi

if command -v tmux >/dev/null 2>&1; then
	alias tmux='tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf'
fi
