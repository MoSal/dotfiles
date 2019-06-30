#!/bin/sh
xrdb $HOME/.Xdefaults
xset s off
xmodmap $HOME/.Xmodmap
#anamnesis --start &
parcellite &
#pulseaudio --start
#xrandr --dpi 104
#xrandr --output HDMI1 --set 'Broadcast RGB' Full
#xrandr --output HDMI1 --mode 3840x2160

#exec awesome
exec awesome --no-argb
#exec openbox
