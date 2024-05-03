function ls --wraps='eza -l --icons=always --color=always --smart-group --time-style relative' --wraps='eza -l --icons=always --color=always --total-size --time-style relative' --description 'alias ls=eza -l --icons=always --color=always --time-style relative'
  eza -l --icons=always --color=always --smart-group --time-style relative $argv
        
end
