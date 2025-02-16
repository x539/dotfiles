alias ls='ls --color=auto'
alias ll='ls --color=auto -lZ'
alias ip='ip -color=auto'
alias dc='docker compose'
alias dr='docker compose run --rm'
alias g='git'
alias sudo='sudo '
alias diff='diff -U3 --color=auto'


if command -v kubectl >/dev/null 2>&1; then
	if [ -v ZSH_NAME ]; then
		source <(kubectl completion zsh)
	elif [ -v BASH ]; then
		source <(kubectl completion bash)
	fi
	alias k=kubectl
	alias kctx='kubectl config use-context'
	alias kns='kubectl config set-context --current --namespace'
	complete -F __start_kubectl k
fi

if command -v tmux >/dev/null 2>&1; then
	alias tmux='tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf'
fi
