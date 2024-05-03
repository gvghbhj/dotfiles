if status is-interactive
    # Commands to run in interactive sessions can go here
    # set fish_greeting " Welcome $USER, How are you doing, Get ready to fish!"
    #
    __postexec_notify_on_long_running_commands # script stored in .config/fish/functions/ which notifies using notify-send when a long command is completed.

    # abbreviations: 
    abbr --add n nvim
    abbr --add g gcc -W -Wextra -std=gnu11 -ggdb3 -o 
    abbr --add m mullvad 
    abbr --add v valgrind --tool=memcheck --leak-check=full --track-origins=yes -s 
    abbr --add se sudoedit
    abbr --add fs fastfetch
    abbr --add ki killall
    abbr --add pas sudo pacman -S
    abbr --add ra ranger
    abbr --add za zathura --fork
    abbr --add par sudo pacman -Rcs
    abbr --add pac sudo pacman 
    abbr --add pasu sudo pacman -Syu
    abbr --add gps git push origin
    abbr --add gpu git pull -p origin main
    abbr --add gc git commit -m

    zoxide init fish | source
    alias cd='z'

    bind \eF fg
end


