#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

if
    [[ ! -n ${CONTAINER_ID} ]] &&
        uwsm check may-start
then
    exec uwsm start hyprland-uwsm.desktop
fi
