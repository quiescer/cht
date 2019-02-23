#!/usr/bin/env sh

# A rofi front-end script for the cht cheatsheet viewer, designed to
# be used to allow selection of a cheatsheet. Put this in a directory
# such as $HOME/bin/rofi_scripts and bind it to some hotkey combination
# in your window manager.
#
# e.g. for i3:
#   bindsym $mod+c exec --no-startup-id i3-msg 'exec "$HOME/bin/rofi-scripts/cht.sh"'

# Should probably be made more general for other types of documents
# besides cheatsheets.

list_cheatsheets()
{
    # Initialise and read config
    sheets_dir=""
    conf=$HOME/.config/cht.conf

    if [ -f $conf ]; then
        . $conf
    fi

    if [ -z "$sheets_dir" ]; then
        sheets_dir="$HOME/Documents/Cheatsheets"
    fi

    cd "$sheets_dir"
    # Find interesting files, remove the leading "./" and exclude _files
    # directories that contain image files, CSS, etc that are created by
    # web browsers when saving a web page.
    find -regex '.*\.\(txt\|png\|jpg\|pdf\|html\)' | sed 's@^\./@@' | egrep -v '_files\/' | sort
}

cheatsheet=$( (list_cheatsheets) | rofi -dmenu -i -hide-scrollbar -p "Select cheatsheet")

if [ -n "${cheatsheet}" ]
then
    cht --spawn "${cheatsheet}"
fi
