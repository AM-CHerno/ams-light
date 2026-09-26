#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias clear='clear && printf "\e[3J"'

export PATH=$PATH:/home/cherno/.spicetify
export QT_QPA_PLATFORMTHEME=qt5ct

    echo
    echo ' __        __   _    ____  ____  __  __  _____        _    __  __ '
    echo ' \ \      / /__| |  / ___|/    \|  \/  || ____|      / \  |  \/  |'
    echo '  \ \ /\ / / _ \ |  | |   | || || |\/| ||  _|       / _ \ | |\/| |'
    echo '   \ V  V /  __/ |_ | |__ | || || |  | || |___     / ___ \| |  | |'
    echo '    \_/\_/ \___|___/\____|\____/|_|  |_||_____|   /_/   \_\_|  |_|'
    echo
neofetch
export PATH="$HOME/.local/bin:$PATH"
alias clear='clear && printf "\e[3J"'
alias hyprland="start-hyprland"
