function download_music
    yt-dlp -f bestaudio \
        -x \
        --audio-format flac \
        --audio-quality 320k \
        --write-playlist-metafiles \
        --embed-metadata \
        --embed-thumbnail \
        $argv
end
