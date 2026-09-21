#!/bin/bash
source ~/.cache/wal/colors.sh

GTK_CSS="
window, .background {
    background-color: ${background};
    color: ${foreground};
}

placessidebar {
    background-color: ${background};
    color: ${foreground};
}

placessidebar row {
    background-color: ${background};
    color: ${foreground};
}

placessidebar row:selected {
    background-color: ${color4};
    color: ${foreground};
}

headerbar {
    background-color: ${color1};
    color: ${foreground};
}

button {
    background-color: ${color1};
    color: ${foreground};
}

entry {
    background-color: ${color1};
    color: ${foreground};
}

treeview {
    background-color: ${background};
    color: ${foreground};
}

treeview:selected {
    background-color: ${color4};
    color: ${foreground};
}
"

echo "$GTK_CSS" > ~/.config/gtk-3.0/gtk.css
echo "$GTK_CSS" > ~/.config/gtk-4.0/gtk.css
