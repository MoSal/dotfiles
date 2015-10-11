#!/bin/sh
xrdb $HOME/.Xdefaults
xset s off
xmodmap $HOME/.Xmodmap
xrandr --output LVDS --off
xrandr --output HDMI-0 --mode 1920x1080
xrandr --dpi 160
parcellite &
anamnesis --start &
mpv --idle --no-force-window &

#/home/user64/bin/b-warn &

#exec awesome
exec awesome --no-argb
#exec openbox
