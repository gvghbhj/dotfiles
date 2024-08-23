#!/bin/fish

while true 
  kitty +kitten panel -o background_opacity=0.0 -o tab_bar_min_tabs=2 --edge=background tty-clock -S -t -c -s -C 6
end
