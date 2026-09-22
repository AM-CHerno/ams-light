function fish_greeting
    echo -ne '\x1b[38;5;16m'
    echo ' __        __   _    ____  _____  __  __  _____       _    __  __ '
    echo ' \ \      / /__| |  /  __|/  _  \|  \/  || ____|     / \  |  \/  |'
    echo '  \ \ /\ / / _ \ |  | /   | | | || |\/| ||  _|      / _ \ | |\/| |'
    echo '   \ V  V /  __/ |_ | \__ | |_| || |  | || |___    / ___ \| |  | |'
    echo '    \_/\_/ \___|___/\____|\_____/|_|  |_||_____   /_/   \_\_|  |_|'
    echo '                                                                   '
    echo '                                                                   '
    set_color normal
    command -v neofetch &> /dev/null && neofetch --key-padding-left 5
end
