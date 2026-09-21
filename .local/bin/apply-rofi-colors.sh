#!/bin/bash
source ~/.cache/wal/colors.sh

cat > ~/.cache/wal/colors-rofi-dark-fixed.rasi << RASIEOF
* {
    background: ${background};
    foreground: ${foreground};
    border-color: ${background};
    normal-background: ${background};
    normal-foreground: ${foreground};
    active-background: ${color1};
    active-foreground: ${foreground};
    urgent-background: ${color3};
    urgent-foreground: ${foreground};
    selected-normal-background: ${color1};
    selected-normal-foreground: ${foreground};
    selected-active-background: ${color3};
    selected-active-foreground: ${foreground};
    selected-urgent-background: ${color5};
    selected-urgent-foreground: ${foreground};
    alternate-normal-background: ${background};
    alternate-normal-foreground: ${foreground};
    alternate-active-background: ${background};
    alternate-active-foreground: ${foreground};
    alternate-urgent-background: ${background};
    alternate-urgent-foreground: ${foreground};
}

window {
    background-color: ${background};
    border: 0;
    padding: 2.5ch;
}

mainbox {
    background-color: ${background};
    border: 0;
    padding: 0;
}

listview {
    background-color: ${background};
    border: 2px 0px 0px;
    border-color: ${background};
    spacing: 2px;
    scrollbar: true;
    padding: 2px 0px 0px;
    fixed-height: 0;
}

element {
    background-color: ${background};
    text-color: ${foreground};
    border: 0;
    padding: 1px;
}

element normal.normal {
    background-color: ${background};
    text-color: ${foreground};
}

element selected.normal {
    background-color: ${color1};
    text-color: ${foreground};
}

element-text {
    text-color: inherit;
    background-color: inherit;
}

element-icon {
    background-color: inherit;
}

inputbar {
    background-color: ${background};
    text-color: ${foreground};
    spacing: 0;
    padding: 1px;
    children: [ "prompt", "textbox-prompt-colon", "entry", "case-indicator" ];
}

entry {
    background-color: ${background};
    text-color: ${foreground};
}

prompt {
    background-color: ${background};
    text-color: ${foreground};
}

textbox-prompt-colon {
    background-color: ${background};
    text-color: ${foreground};
    str: ":";
    margin: 0px 0.3em 0em 0em;
    expand: false;
}

case-indicator {
    background-color: ${background};
    text-color: ${foreground};
}

message {
    background-color: ${background};
    border-color: ${background};
    border: 2px 0px 0px;
    padding: 1px;
}

textbox {
    background-color: ${background};
    text-color: ${foreground};
}

scrollbar {
    background-color: ${background};
    handle-color: ${color1};
    width: 4px;
    border: 0;
    handle-width: 8px;
    padding: 0;
}
RASIEOF
