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
