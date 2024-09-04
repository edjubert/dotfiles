function clean_pacman
    set_color cyan
    echo "Clean unused packages"
    set_color normal
    paru -Qdtq | paru -Rns -

    set_color cyan
    printf "\nClean cache for uninstalled packages\n"
    set_color normal
    paru -Sc

    set_color cyan
    printf "\nClean all packages cache except the 3 most recent versions\n"
    set_color normal
    sudo paccache -r

    set_color cyan
    printf "\nAfter cleaning, used space\n"
    set_color normal
    du -sh /var/cache/pacman/pkg
    du -sh /var/lib/pacman
    du -sh $HOME/.cache/paru/clone
    du -sh $HOME/.cache/paru/diff
end
