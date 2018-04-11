alias dc='docker-compose'
alias g='git'
alias ll='ls -l'
alias sudo='sudo '

if command -v tmux >/dev/null 2>&1; then
	alias tmux='tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf'
fi
