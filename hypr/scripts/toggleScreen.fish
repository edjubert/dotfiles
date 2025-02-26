#!/usr/bin/env fish

set scriptTitle "Screen toggler"

function usage
    echo "Usage: toggleScreen [--off|--on] <monitor>"
end

function toggleScreen
    if test (hyprctl monitors -j | jq "[.[] | select(.name == \"$argv[1]\")] | length") = 0
        set msg "Monitor '$argv[1]' does not exists"
        echo $msg
        notify-send $scriptTitle $msg

        exit 1
    end

    set enable enable

    if test $argv[2] = disable -o $argv[2] = enable
        set enable $argv[2]
    else
        if test (hyprctl monitors -j | jq ".[] | select(.name == \"$argv[1]\").disabled") = false
            set enable disable
        end
    end

    if test (hyprctl monitors -j | jq 'length') = 1
        set msg "'$argv[1]' is the only monitor, should not disable it"
        echo $msg
        notify-send $scriptTitle $msg
        exit 1
    end

    set monitorId (hyprctl monitors -j | jq -r ".[] | select(.name == \"$argv[1]\").id")
    set monitorClients (hyprctl clients -j | jq -c ".[] | select(.monitor==$monitorId) | {workspaceId: .workspace.id, pid: .pid}")

    hyprctl keyword monitor $argv,$enable

    astal -i hyprpanel -q
    ags run &

    if test "$enable" = enable
        sleep 5
        hyprctl keyword monitor $argv[1] 2560x1440@165.0, 5120x0, 1.33

        sleep 2
        notify-send "Toggle Screen Script" "Hello again internal monitor"
    else
        for client in $monitorClients
            set workspaceId (echo $client | jq -r '.workspaceId')
            set pid (echo $client | jq -r '.pid')

            echo "WORKSPACE ID: $workspaceId, PID: $pid"
            hyprctl dispatch movetoworkspace (math $workspaceId - 10),pid:$pid
        end
    end
end

switch $argv[1]
    case --off
        if test (count $argv) -ne 2
            usage
            return 1
        end
        echo "Set screen off"
        toggleScreen $argv[2] disable
    case --on
        if test (count $argv) -ne 2
            usage
            return 1
        end
        echo "Set screen on"
        toggleScreen $argv[2] enable
    case '*'
        if test (count $argv) -ne 1
            usage
            return 1
        end
        echo "Default to toggling screen"
        toggleScreen $argv[1]
end
