#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@" &
  fi
}

run dex --autostart --environment Awesome

run /home/edjubert/.config/awesome/scripts/hotplug.sh
# run /usr/bin/picom --config /home/edjubert/.config/picom/picom.conf --backend glx
run /usr/bin/picom --config /home/edjubert/.config/awesome/configurations/picom.conf

# run xinput set-prop "UNIW0001:00 093A:0255 Touchpad" "libinput Tapping Enabled" 1

run /usr/lib/polkit-kde-authentication-agent-1

# run xinput set-prop "UNIW0001:00 093A:0255 Touchpad" "libinput Natural Scrolling Enabled" 1
run tilda
run fusuma
# run mpDris2
# run xss-lock --transfer-sleep-lock -- i3lock -i /home/edjubert/Workspace/dotfiles/Wallpapers/hiking_in_space.png --nofork
run xss-lock --transfer-sleep-lock -- i3lock --blur 5 --screen 1 --indicator --time-str="%H:%M:%S" --keylayout 0 --time-color='#ffffffee' --date-color='#ffffffee' --layout-color='#ffffffee' --verif-color='#ffffffee' --nofork
run nm-applet
run greenclip daemon

run pasystray

