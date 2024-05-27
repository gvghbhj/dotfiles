function ls --wraps='eza -l --icons=always --color=always --smart-group --time-style relative -a --hyperlink' --wraps='eza -l --icons=always --color=always --total-size --time-style relative -a --hyperlink' --description 'alias ls=eza -l --icons=always --color=always --time-style relative -a --hyperlink'
  eza -l --icons=always --color=always --smart-group --time-style relative -a --hyperlink $argv
        
end
