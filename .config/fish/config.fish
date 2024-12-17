if status is-interactive
    
    # ABBREVIATIONS: 
    
    # GENERAL:
    #
    abbr --add n nvim
    abbr --add fs fastfetch
    abbr --add ra ranger
    abbr --add za zathura --fork
    abbr --add ki killall
    abbr --add se sudoedit
    abbr --add f fzf
    abbr --add net sudo netstat -nputwvee # to get list of outgoing network connections, consult man netstat

    # C PROGRAMMING:
    #
    abbr --add v valgrind --tool=memcheck --leak-check=full --track-origins=yes -s 
    abbr --add g gcc -W -Wextra -std=gnu11 -ggdb3 -pedantic-errors -o

    # MULLVAD VPN:
    
    abbr --add ms mullvad status
    abbr --add mc mullvad connect
    abbr --add md mullvad disconnect
    abbr --add mr mullvad relay

    # GIT:
    
    abbr --add push git push origin
    abbr --add pull git pull origin 
    abbr --add cm git commit -a -m
    abbr --add st git status --short -uno

    # asusctl:
    
    abbr --add asq asusctl profile -P Quiet
    abbr --add asb asusctl profile -P Balanced
    abbr --add asp asusctl profile -P Performance
    


    # ZOXIDE:

    zoxide init fish | source
    alias cd='z'
    


    # BINDINGS
    
    bind \ef 'fg; commandline -f repaint'
    bind \ez 'zi; commandline -f repaint'
    bind \en 'cliphist list | fzf --preview="" --height=75% -d "\t" --with-nth 2 | cliphist decode | wl-copy;commandline -f repaint'
    bind \eo 'nvim (fzf)'
    bind \cy execute
end
