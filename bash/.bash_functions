#!/bin/bash

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

y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd <"$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

mubuntu() {
    sudo mount UUID=4f6a16b3-0e8a-4f42-871e-5b8404324e4a /mnt/ubuntu22
    sudo mount --bind /mnt/ubuntu22/home/litt/IsaacLab /home/litt/IsaacLab
}

ccd() {
    if [[ -z $1 ]]; then
        echo "Usage: ccd dirname"
        return 0
    fi
    mkdir -p "$1" && cd "$1" || return
}

awg0() {
    systemctl status awg-quick@awg0.service | grep "Active: active" >/dev/null
    srv_status=$?

    case "$1" in
    "start") sudo systemctl start awg-quick@awg0.service ;;
    "stop") sudo systemctl stop awg-quick@awg0.service ;;
    "") if ((srv_status == "0")); then
        echo "Stopping awg0"
        sudo systemctl stop awg-quick@awg0.service >/dev/null
    else
        echo "Starting awg0"
        sudo systemctl start awg-quick@awg0.service >/dev/null
    fi ;;
    *) echo "Usage: awg0 [start|stop]" ;;
    esac
}
