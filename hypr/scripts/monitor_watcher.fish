#!/usr/bin/env fish

while true
    set event (hyprctl events | grep --line-buffered "monitoradded\|monitorremoved")

    if test "$event" = monitorremoved
        ~/.config/fish/functions/toggleScreen.fish
    end
end
