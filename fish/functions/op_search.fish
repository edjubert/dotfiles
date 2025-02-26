function op_search
    op item list | fzf | awk '{print $1}' | xargs op item get --reveal --fields label=password | wl-copy
end
