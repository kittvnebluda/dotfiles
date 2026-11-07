#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions

PROMPT_COMMAND=build_prompt

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TMUX_TMPDIR="/var/tmp"

# direnv
eval "$(direnv hook bash)"

[ -f ~/.bash_secrets ] && . ~/.bash_secrets

. "$HOME/.local/share/../bin/env"

# opencode
export PATH=/home/litt/.opencode/bin:$PATH
