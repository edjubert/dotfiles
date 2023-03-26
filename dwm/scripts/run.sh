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

# run dex --autostart --environment dwm
run /home/edjubert/.config/awesome/scripts/hotplug.sh
run /usr/bin/lxsession
run xss-lock --transfer-sleep-lock -- i3lock --blur 5 --screen 1 --indicator --time-str="%H:%M:%S" --keylayout 0 --time-color='#ffffffee' --date-color='#ffffffee' --layout-color='#ffffffee' --verif-color='#ffffffee' --nofork
run nm-applet
run greenclip daemon
run deadd-notification-center
run fusuma

# Tuxedo light RGB bar and animate
brightnessctl --device="lightbar_rgb:1:status" set 100%+
brightnessctl --device="lightbar_rgb:2:status" set 100%+
brightnessctl --device="lightbar_rgb:3:status" set 100%+
brightnessctl --device="lightbar_animation::status" set 100%+

~/.config/dwm/scripts/bar.sh &
while type dwm >/home/edjubert/dwm.log; do dwm && continue || break; done
