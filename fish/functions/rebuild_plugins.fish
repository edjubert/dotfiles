function rebuild_plugins
    set_color blue
    echo -ne "Building Go Datasource Backend project:   Started\033[0K\r"
    set_color white
    set CURRENT (pwd)
    cd $CONNECTIN/infrastructure/tools/docker || exit 1
    if docker compose restart axens-plugins >/dev/null
        set_color green
        echo -e "Building axens-plugins project:   Ok\033[0K\r"
        set_color white

        set msg "Axens plugins rebuilt"

        notify-send $msg
        speak $msg
    end

    cd $CURRENT || exit 1
end
