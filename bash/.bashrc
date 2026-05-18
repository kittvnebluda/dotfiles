#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

PROMPT_COMMAND=build_prompt

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TMUX_TMPDIR="/var/tmp"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# ROS
export RCUTILS_COLORIZED_OUTPUT=1

# Distrobox
if [[ ${CONTAINER_ID} == "noble-ros-jazzy" ]]; then
    export ROS_DISTRO=jazzy
    source /etc/profile.d/bash_completion.sh
    source /opt/ros/jazzy/setup.bash
    export TERM=xterm-256color
else
    export ROS_DISTRO=humble
fi

if [[ -n $ROS_DISTRO ]]; then
    export ROS_DOMAIN_ID=0
    export ROS_VERSION=2
    export ROS_PYTHON_VERSION=3
fi

# direnv
eval "$(direnv hook bash)"
