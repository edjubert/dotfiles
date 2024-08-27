function rebuild_datasource
    set_color blue
    echo -ne "Building Go Datasource Backend project:   Started\033[0K\r"
    set_color white
    set CURRENT (pwd)
    cd $CONNECTIN/infrastructure/tools/docker || exit 1
    if docker compose restart datasource-backend >/dev/null
        set_color green
        echo -e "Building Go Datasource Backend project:   Ok\033[0K\r"
        set_color white

        set grafana_start (date '+%s')
        docker compose restart grafana

        set_color blue
        echo -ne "Running Go tests:                         Started\033[0K\r"
        set_color white

        cd $CONNECTIN/grafana/datasource-backend || exit 1
        if mage test >/dev/null
            set_color green
            echo -e "Running Go tests:                         Ok\033[0K\r"
            set_color white
        else
            set_color red
            echo -e "Running Go tests:                         Error\033[0K\r"
            set_color white
        end

        set_color blue
        echo -ne "Starting Grafana:                         Started\033[0K\r"
        set_color white

        while true
            set started1 (curl -s localhost:3000 | grep '<a href="/login">Found</a>.' | wc -l)
            if [ $started1 -eq 1 ]
                set grafana_end (date '+%s')
                set total_grafana (math $grafana_end - $grafana_start)
                set done_phrase "GRAFANA started in $total_grafana seconds"

                set_color green
                echo -e "Starting Grafana:                         Ok ($total_grafana seconds)\033[0K\r"
                set_color white

                powershell.exe "Add-Type -AssemblyName System.speech;(New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak(\"$done_phrase\")" &
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
    else
        set err_phrase "ERROR rebuilding project"

        set_color red
        printf "\n%s\n" $err_phrase
        set_color white
        powershell.exe "Add-Type -AssemblyName System.speech;(New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak(\"$err_phrase\")" &
    end
end

cd $CURRENT || exit 1
