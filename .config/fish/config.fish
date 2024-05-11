if status is-interactive
    # Commands to run in interactive sessions can go here
    # set fish_greeting " Welcome $USER, How are you doing, Get ready to fish!"
    #
    __postexec_notify_on_long_running_commands # script stored in .config/fish/functions/ which notifies using notify-send when a long command is completed.


    # abbreviations: 
    #
    # GENERAL:
    abbr --add n nvim
    abbr --add fs fastfetch
    abbr --add ra ranger
    abbr --add za zathura --fork
    abbr --add ki killall
    abbr --add se sudoedit

    # C PROGRAMMING:
    abbr --add v valgrind --tool=memcheck --leak-check=full --track-origins=yes -s 
    abbr --add g gcc -W -Wextra -std=gnu11 -ggdb3 -pedantic-errors -lreadline -o 

    # Mullvad VPN:
    abbr --add ms mullvad status
    abbr --add mc mullvad connect
    abbr --add md mullvad disconnect
    abbr --add mr mullvad relay

    # pacman:
    abbr --add pas sudo pacman -S
    abbr --add par sudo pacman -Rcs
    abbr --add pac sudo pacman 
    abbr --add pasu sudo pacman -Syu

    # git:
    abbr --add push git push origin
    abbr --add pull git pull origin 
    abbr --add cm git commit -a -m
    abbr --add st git status --short -uno
    


    # zoxide
    zoxide init fish | source
    alias cd='z'
    


    # bindings
    bind \eF 'fg; commandline -f repaint'
    bind \ez 'zi; commandline -f repaint'
    bind \en 'cliphist list | fzf --preview="" --height=80% | cliphist decode | wl-copy; commandline -f repaint'
end


