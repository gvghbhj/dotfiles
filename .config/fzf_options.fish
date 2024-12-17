set --universal --export FZF_DEFAULT_OPTS '
  --color=fg:#cdd6f4,fg+:#d0d0d0,bg:#1e1e2e,bg+:#262626
  --color=hl:#f38ba8,hl+:#5fd7ff,info:#cba6f7,marker:#b4befe
  --color=prompt:#cba6f7,spinner:#f5e0dc,pointer:#f5e0dc,header:#f38ba8
  --color=border:#b4befe,label:#aeaeae,query:#d9d9d9
  --border-label=" ARCH BTW " --border-label-pos="0" 
  --preview-window="border-rounded" --padding="0" --prompt="𝝺 " --marker="->"
  --pointer="◆" --separator="." --scrollbar="|" --info="right"
  --bind "ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)"
  --preview="bat --color=always --style=numbers {}"'
