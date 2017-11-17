#!/bin/sh

: ${XDG_BIN_HOME:="$HOME/.local/bin"}
: ${XDG_CACHE_HOME:="$HOME/.cache"}
: ${XDG_CONFIG_HOME:="$HOME/.config"}
: ${XDG_DATA_HOME:="$HOME/.local/share"}

export XDG_BIN_HOME XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME

export PATH="$XDG_BIN_HOME:$PATH"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export TMUX_TMPDIR="${XDG_RUNTMIME_DIR}"

if command -v tmux >/dev/null 2>&1; then
	alias tmux='tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf'
fi
