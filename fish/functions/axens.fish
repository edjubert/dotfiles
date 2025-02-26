function axens
    set grafana_start (date '+%s')

    set backend_plugin_name axensconnectin-connectinqs-datasource

    cd $CONNECTIN/grafana/datasource-backend/
    mage BuildPlugin $backend_plugin_name dev
    mage test

    CONNECTIN=$CONNECTIN GRAFANA=$GRAFANA $CONNECTIN/infrastructure/tools/docker/start-dev.sh

    sleep 10

    while true
        set started1 (curl -s localhost:3000 | grep '<a href="/login">Found</a>.' | wc -l)
        if [ $started1 -eq 1 ]
            set grafana_end (date '+%s')
            set total_grafana (math $grafana_end - $grafana_start)
            set done_phrase "Connectin started in $total_grafana seconds"

            set_color green
            echo -e "Starting Grafana:                         Ok ($total_grafana seconds)\033[0K\r"
            set_color white

            notify-send --icon "/home/edjubert/connectin.png" --transient "Axens - Connectin" $done_phrase
            speak $done_phrase
            break
        else
            set grafana_end (date '+%s')
            set total_grafana_tmp (math $grafana_end - $grafana_start)
            set_color blue
            echo -ne "Starting Grafana:                         Starting ($total_grafana_tmp seconds)\033[0K\r"
            set_color white
            sleep 1
        end
    end
end
