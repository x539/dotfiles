export EDITOR="nvim -e"
export VISUAL="nvim"
export KUBE_EDITOR="$VISUAL"

if [ -x /usr/bin/ccache ]; then
	export USE_CCACHE="1"
	export CCACHE_EXEC="/usr/bin/ccache"
fi

eval $(dircolors)

source $XDG_CONFIG_HOME/sh/locale.sh

# Setup Interactive shells
if [[ $- =~ 'i' ]]; then
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	powerline-daemon -q

	if [ -v ZSH_NAME ]; then
		source /usr/share/powerline/bindings/zsh/powerline.zsh
		source /usr/share/doc/fzf/examples/key-bindings.zsh
		source /usr/share/doc/fzf/examples/completion.zsh
	elif [ -v BASH ]; then
		source /usr/share/powerline/bindings/bash/powerline.sh
		source /usr/share/doc/fzf/examples/key-bindings.bash
		source /usr/share/doc/fzf/examples/completion.bash
	fi

	source $XDG_CONFIG_HOME/sh/aliases.sh
fi
