#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="ls -ahlF"
alias l='ls -CF'
alias nb="nvim ~/.bashrc"
alias sb="source ~/.bashrc"
alias sv="source venv/bin/activate"
alias gs="git status"
alias gl="git log --all --graph --decorate --date=short --pretty=format:'%C(auto)%h %ad %s%d'"
alias pm="systemctl start nvidia-persistenced.service"

create_simlink_on_dhe() {
    sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/$1
}

get_git_branch() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo -e " \[\e[35m\]($(git branch --show-current 2>/dev/null))\[\e[0m\]"
    fi
}

build_prompt() {
    EXIT_CODE=$? # Capture exit code of the last command immediately

    GRAY="\[\e[38;5;244m\]"
    YELLOW="\[\e[33m\]"
    BLUE="\[\e[34m\]"
    RESET="\[\e[0m\]"

    if [ $EXIT_CODE -eq 0 ]; then
        ARROW_COLOR="\[\e[32m\]" # Green if success
    else
        ARROW_COLOR="\[\e[31m\]" # Red if error
    fi

    if [ "$EUID" -ne 0 ]; then
        USER_COLOR="\[\e[32m\]" # Green for normal user
    else
        USER_COLOR="\[\e[31m\]" # Red for root
    fi

    PS1="${GRAY}╭─ ${YELLOW}\t ${GRAY}── ${USER_COLOR}\u@\h${RESET}:${BLUE}\w$(get_git_branch)\n${ARROW_COLOR}╰─❯ ${RESET}\$ "
}

PROMPT_COMMAND=build_prompt

export EDITOR="nvim"
export VISUAL="$EDITOR"
export TMUX_TMPDIR="/var/tmp"

# Yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd <"$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# ROS
export RCUTILS_COLORIZED_OUTPUT=1
alias isb="source install/setup.bash"
alias cb='colcon build --symlink-install'

# Distrobox
if [[ ${CONTAINER_ID} = "ubuntu-24" ]]; then
    export QT_QPA_PLATFORM=xcb
    export ROS_DOMAIN_ID=63
    export ROS_VERSION=2
    export ROS_PYTHON_VERSION=3
    export ROS_DISTRO=jazzy

    source /etc/profile.d/bash_completion.sh
    source /opt/ros/jazzy/setup.bash
fi

# direnv
eval "$(direnv hook bash)"

function mubuntu() {
    sudo mount UUID=4f6a16b3-0e8a-4f42-871e-5b8404324e4a /mnt/ubuntu22
    sudo mount --bind /mnt/ubuntu22/home/litt/IsaacLab /home/litt/IsaacLab
}
