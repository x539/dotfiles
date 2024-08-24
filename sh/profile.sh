export EDITOR="vi -e"
export VISUAL="vim"
export KUBE_EDITOR="$VISUAL"


eval $(dircolors)

source $XDG_CONFIG_HOME/sh/locale.sh

# ADB
if [ -d "$HOME/Android/platform-tools" ]; then
	export PATH="$HOME/Android/platform-tools:$PATH"
fi

# Setup Interactive shells
if [[ $- =~ 'i' ]]; then
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	powerline-daemon -q
	source /usr/share/powerline/bindings/bash/powerline.sh

	source $XDG_CONFIG_HOME/sh/aliases.sh
fi
