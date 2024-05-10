function ls --wraps='eza -l --icons=always --color=always --smart-group --time-style relative -a' --wraps='eza -l --icons=always --color=always --total-size --time-style relative -a' --description 'alias ls=eza -l --icons=always --color=always --time-style relative -a'
  eza -l --icons=always --color=always --smart-group --time-style relative -a $argv
        
end
