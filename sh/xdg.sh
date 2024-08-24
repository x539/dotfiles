#!/bin/false

: ${XDG_BIN_HOME:="$HOME/.local/bin"}
: ${XDG_CACHE_HOME:="$HOME/.cache"}
: ${XDG_CONFIG_HOME:="$HOME/.config"}
: ${XDG_DATA_HOME:="$HOME/.local/share"}
: ${XDG_STATE_HOME:="$HOME/.local/state"}

export XDG_BIN_HOME XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_STATE_HOME

[[ $PATH =~ $XDG_BIN_HOME ]] || export PATH="$XDG_BIN_HOME:$PATH"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export TMUX_TMPDIR="$XDG_RUNTMIME_DIR"
export HISTFILE="$XDG_STATE_HOME/history/bash"
export PSQL_HISTORY="$XDG_STATE_HOME/history/psql"
export PYTHON_HISTFILE="$XDG_STATE_HOME/history/python"

source $XDG_CONFIG_HOME/sh/profile.sh
