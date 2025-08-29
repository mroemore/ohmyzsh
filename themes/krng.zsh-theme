if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
if [ $UID -eq 0 ]; then DIRBGCOL="white"; else DIRBGCOL="black"; fi
typeset -A PROMPT_SYM
PROMPT_SYM[cross]="☩ ♱ ☨ ☦ ☧ ♱ ⚕ ✞"
PROMPT_SYM[misc]="☍ ☌ ☤ ⚔ ⚛ ⛆ ♲"
PROMPT_SYM[penta]="⚝ ⛥ ⛤ ⛧"
PROMPT_SYM[circle]="⛭ ⚇ ♾"

local PAREN= "❲ ❳ ❰ ❱ ❝ ❞ ❴ ❵"
local STATUS= ":⚠ ⛒ ⛔ ☻"

PROMPT='\
%{$bg[$DIRBGCOL]%} \
%{$fg[$NCOLOR]%}\
%c \
%0(?,\
%{${fg_bold[blue]}%}$PROMPT_SYM[2] ,\
%{${fg_bold[red]}%}$PROMPT_SYM[14] \
)\
%{$reset_color%}'
RPROMPT='\
%{$fg[$NCOLOR]%}\
$(git_prompt_info) \
%{$reset_color%}\
%{$bg[black]%}%{$fg[blue]%}[%U%t%u]\
%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg_bold[yellow]}%}[%{${fg_bold[blue]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${fg_bold[yellow]}%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{${fg[white]}%}⠪%{${fg_bold[yellow]}%}☻%{${fg[white]}%}⠕%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{${fg[white]}%}⠪%{${fg_bold[red]}%}⚑%{${fg[white]}%}⠕%{$reset_color%}"

#echo "11:34:31:59" | awk '{i=1;o=""; while(match(substr($0,i),/([0-9]{1,2}):?/)){u[1]="❲⣿❳";u[2]="❲⠁❳";u[3]="❲⠅❳";u[4]="❲⠓❳";u[5]="❲⡪❳";u[6]="❲⢮❳";r=r substr($0,i,RSTART-1);n=substr($0,i+RSTART-1,RLENGTH);nr=n%6;nl=(n/6)-(nr/6);i=i+RSTART+RLENGTH-1;r=r "" u[nl+0] "" u[nr+0] "|";} r=r substr($0, pos); print r; }'
