export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
setopt hist_ignore_dups

autoload -U compinit
compinit
setopt auto_cd
setopt auto_pushd
setopt no_beep
autoload -U colors; colors
# $B0lHL%f!<%6;~(B
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# root$B%f!<%6;~(B($BB@;z$K$7%"%s%@!<%P!<(B
if [ ${UID} -eq 0 ]; then
      tmp_prompt="%B%U${tmp_prompt}%u%b"
        tmp_prompt2="%B%U${tmp_prompt2}%u%b"
          tmp_rprompt="%B%U${tmp_rprompt}%u%b"
            tmp_sprompt="%B%U${tmp_sprompt}%u%b"
            fi

            PROMPT=$tmp_prompt    # $BDL>o$N%W%m%s%W%H(B
            PROMPT2=$tmp_prompt2  # $B%;%+%s%@%j$N%W%m%s%W%H(B($B%3%^%s%I$,(B2$B9T0J>e$N;~$KI=<($5$l$k(B)
            RPROMPT=$tmp_rprompt  # $B1&B&$N%W%m%s%W%H(B
            SPROMPT=$tmp_sprompt  # $B%9%Z%kD{@5MQ%W%m%s%W%H(B
# SSH$B%m%0%$%s;~$N%W%m%s%W%H(B
            [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
              PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
              ;

### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*|)
  precmd() {
          echo -ne "\033]0;${USER}@${HOST%%.*}\007"
            }
              ;;
              esac


alias ls="ls -G"
alias ll="ls -la"
alias la="ls -a"
alias gitst="git status"
alias gitdf="git diff"
alias gitbr="git branch"
