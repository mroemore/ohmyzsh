if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
if [ $UID -eq 0 ]; then DIRBGCOL="white"; else DIRBGCOL="black"; fi
typeset -A CSYMB
CSYMB[cross]="☩♱☨☦☧♱⚕✞"
CSYMB[misc]="☍☌☤⚔⚛⛆♲"
CSYMB[penta]="⚝⛥⛤⛧"
CSYMB[circle]="⛭⚇♾"

CSYMB[separators]="❲❳❰❱❝❞❴❵⠪⠕"
CSYMB[status]="⚠⛒⛔☻⚑"

PROMPT='\
%{$bg[$DIRBGCOL]%} \
%{$fg[$NCOLOR]%}\
${CSYMB[separators][3]} \
%c \
${CSYMB[separators][4]}\
%0(?,\
%{${fg_bold[blue]}%}${CSYMB[cross][6]} ,\
%{${fg_bold[red]}%}${CSYMB[penta][4]} \
)\
%{$reset_color%}'

RPROMPT='\
%{$fg[$NCOLOR]%}\
$(git_prompt_info) \
%{$reset_color%}\
%{$bg[black]%}%{$fg[blue]%}[%U%t%u]\
%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg_bold[yellow]}%}${CSYMB[separators][1]}%{${fg_bold[blue]}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${fg_bold[yellow]}%}${CSYMB[separators][2]}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{${fg[white]}%}${CSYMB[separators][9]}%{${fg_bold[yellow]}%}${CSYMB[status][5]}%{${fg[white]}%}${CSYMB[separators][10]}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{${fg[white]}%}${CSYMB[separators][9]}%{${fg_bold[red]}%}${CSYMB[status][4]}%{${fg[white]}%}${CSYMB[separators][10]}%{$reset_color%}"

#echo "11:34:31:59" | awk '{i=1;o=""; while(match(substr($0,i),/([0-9]{1,2}):?/)){u[1]="❲⣿❳";u[2]="❲⠁❳";u[3]="❲⠅❳";u[4]="❲⠓❳";u[5]="❲⡪❳";u[6]="❲⢮❳";r=r substr($0,i,RSTART-1);n=substr($0,i+RSTART-1,RLENGTH);nr=n%6;nl=(n/6)-(nr/6);i=i+RSTART+RLENGTH-1;r=r "" u[nl+0] "" u[nr+0] "|";} r=r substr($0, pos); print r; }'
