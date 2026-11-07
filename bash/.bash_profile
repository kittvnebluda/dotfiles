#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$HOME/.local/bin:$HOME/Projects/llama.cpp/build/bin:$HOME/Projects/stable-diffusion.cpp/build/bin:$HOME/.cargo/bin"

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

if [[ ! -n ${CONTAINER_ID} ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

. "$HOME/.local/share/../bin/env"
