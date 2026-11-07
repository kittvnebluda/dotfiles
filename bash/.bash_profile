#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.local/bin:$PATH"

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

if [[ ! -n ${CONTAINER_ID} ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
