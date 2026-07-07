#
# ~/.bashrc
#

# Non-interactive: bail immediately
[[ $- != *i* ]] && return

# Archive extractor
ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)  tar xjf "$1" ;;
      *.tar.gz)   tar xzf "$1" ;;
      *.bz2)      bunzip2 "$1" ;;
      *.rar)      unrar x "$1" ;;
      *.gz)       gunzip "$1"  ;;
      *.tar)      tar xf "$1"  ;;
      *.tbz2)     tar xjf "$1" ;;
      *.tgz)      tar xzf "$1" ;;
      *.zip)      unzip "$1"   ;;
      *.Z)        uncompress "$1" ;;
      *.7z)       7z x "$1"   ;;
      *)          echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Bash options
shopt -s checkwinsize expand_aliases histappend

# Completion
[[ -r /usr/share/bash-completion/bash_completion ]] && \
  source /usr/share/bash-completion/bash_completion

# Terminal title
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
    PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "$USER" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
  screen*)
    PROMPT_COMMAND='printf "\033_%s@%s:%s\033\\" "$USER" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

# Colors
if type -P dircolors >/dev/null; then
  if [[ -f ~/.dir_colors ]]; then
    eval "$(dircolors -b ~/.dir_colors)"
  elif [[ -f /etc/DIR_COLORS ]]; then
    eval "$(dircolors -b /etc/DIR_COLORS)"
  else
    eval "$(dircolors -b)"
  fi
fi

if [[ ${EUID} == 0 ]]; then
  PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
  PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias more=less

complete -cf sudo

# fzf
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# Powerline — resolve path dynamically, no hardcoded Python version
if command -v powerline-daemon >/dev/null 2>&1; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  _pl_sh="$(python3 -c 'import powerline, os; print(os.path.join(os.path.dirname(powerline.__file__), "bindings/bash/powerline.sh"))' 2>/dev/null)"
  [[ -f $_pl_sh ]] && source "$_pl_sh"
  unset _pl_sh
fi
