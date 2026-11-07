# ALIEN ISOLATION IS TOP

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="ls -ahlF"
alias l='ls -CF'

alias nb="nvim ~/.bashrc"
alias sb="source ~/.bashrc"

alias dbox='distrobox'
alias refl='sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias ffmpeg1='ffmpeg -vcodec libx265 -crf 28 -i input.mp4 output.mp4'
alias ta='tmux attach'

# Git

alias gs="git status"
alias gl="git log --all --graph --decorate --date=short --pretty=format:'%C(auto)%h %ad %s%d'"

# NVIDIA

alias pm="systemctl start nvidia-persistenced.service"
alias ns='nvidia-smi'
alias watch-egpu='sudo journalctl -kf | grep -E "AER|Xid|NVRM"'
alias watch-gpu-traffic='nvidia-smi dmon -s tu -d 1'

# ROS

alias isb="source install/setup.bash"
alias cb='colcon build --symlink-install'
