#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@" &
  fi
}

xrdb merge ~/.Xresources 
xbacklight -set 10 &
xset r rate 200 50 &
# picom &
picom --config /home/edjubert/.config/picom/picom.conf --experimental-backend &

run dex --autostart --environment dwm
run /home/edjubert/.config/awesome/scripts/hotplug.sh
run /usr/lib/lxsession
run xss-lock --transfer-sleep-lock -- i3lock --blur 5 --screen 1 --indicator --time-str="%H:%M:%S" --keylayout 0 --time-color='#ffffffee' --date-color='#ffffffee' --layout-color='#ffffffee' --verif-color='#ffffffee' --nofork
run nm-applet
run greenclip daemon
run deadd-notification-center
run eww daemon
# feh --bg-fill /home/edjubert/Workspace/dotfiles/Wallpapers/hiking_in_space.jpg

~/.config/dwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done