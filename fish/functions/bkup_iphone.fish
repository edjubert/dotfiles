function bkup_iphone
    ifuse ~/iPhone_mnt/

    echo $argv[1]
    #return

    mkdir -p $argv[1]/{photos,videos}
    rsync -av -P ~/iPhone_mnt/DCIM/**/*.{JPG,JPEG,PNG,HEIC,jpg,jpeg,png,heic} $argv[1]/photos
    rsync -av -P ~/iPhone_mnt/DCIM/**/*.{MOV,MP4,mov,mp4} $argv[1]/videos

    ls ~/iPhone_mnt/DCIM/**/*.{JPG,JPEG,PNG,HEIC,jpg,jpeg,png,heic,MOV,MP4,mov,mp4} | wc -l
    ls $argv[1]/{photos,videos} | wc -l
end
