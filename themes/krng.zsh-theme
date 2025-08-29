if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
if [ $UID -eq 0 ]; then DIRBGCOL="white"; else DIRBGCOL="black"; fi
SYMBOLICA="☩ ♱ ☨ ☦ ⚕ ☍  ☌ ☧ ♱ ☤ ⚝ ⛥ ⛤ ⛧ ⛭ ⚇ ♾ ⚔ ⚛ ⛆ ♲"
PROMPT='%{$bg[$DIRBGCOL]%} %{$fg[$NCOLOR]%}%c %0(?,%{${fg_bold[magenta]}%}⯓,%{${fg_bold[red]}%⛧) %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}$(git_prompt_info) %{$reset_color%}%{$bg[black]%}%{$fg[blue]%}[%U%t%u]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg_bold[yellow]}%}[%{${fg_bold[blue]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${fg_bold[yellow]}%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{${fg[white]}%}⠪%{${fg_bold[yellow]}%}☻%{${fg[white]}%}⠕%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{${fg[white]}%}⠪%{${fg_bold[red]}%}⚑%{${fg[white]}%}⠕%{$reset_color%}"
