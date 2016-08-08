# cht
Keep cheatsheets just a few keystrokes away

A pair of shell scripts to facilitate access to cheatsheets or any other frequently used documentation.

Put cht in a directory in your path (e.g. /usr/local/bin or $HOME/bin if your path includes it) and rofi_scripts/cht.sh can be anywhere as it is designed to be called from your window manager with keybinding including its full path.

rofi_scripts/cht.sh is a shell script that generates a rofi menu listing of suitable documents in a configured cheatsheet directory (e.g. $HOME/Documents/Cheatsheets)

It can be bound to a keyboard shortcut in your window manager to give easy access to cheatsheets, e.g. for i3:

bindsym $mod+c exec --no-startup-id i3-msg 'exec "$HOME/bin/rofi_scripts/cht.sh"'

cht is a shell script which takes a full or partial name of a document in the configured cheatsheet directory, and then will try to match it and use an appropriate viewer to display it based on the file extension. It can be used standalone, e.g.:

$ cht gmail
(will find the first document in the cheatsheets directory and its subdirectories that contains 'gmail' and display with the appropriate viewer application).

It also takes an optional 'spawn terminal window' parameter (-s or --spawn) which is needed to display documents that have terminal-based viewers (such as /usr/bin/less) when there is no allocated terminal, such as when being called from the above rofi script. 

If a 3rd argument is given and the file is a .txt then it will be used to grep the file and display matching lines:

e.g. cht gmail compose
(will grep the matched file and show lines detailing 'compose' - presumably keyboard shortcuts relating to composing a message in this case)

Recommended viewers for common document types:

html - links2 with the -g option for any graphics, can also use w3m, dillo, or a heavyweight browser, but I found links2 best
pdf - zathura (evince and others should work though)
text - /usr/bin/less or any other text file editor/viewer
