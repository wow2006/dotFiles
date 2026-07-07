# Enable Powerlevel10k instant prompt. Must stay near top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.config/dotFiles/.env/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# Fix Wayland for WSL2
export XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir
export WAYLAND_DISPLAY=wayland-0

ZSH_THEME="powerlevel10k/powerlevel10k"

# History
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS INC_APPEND_HISTORY SHARE_HISTORY

# zsh-syntax-highlighting must stay last
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim

# Cache fd binary name once — avoids two subprocess forks
_fd_bin=""
if command -v fdfind >/dev/null 2>&1; then
  _fd_bin=fdfind
elif command -v fd >/dev/null 2>&1; then
  _fd_bin=fd
fi

# eza aliases
if command -v eza >/dev/null 2>&1; then
  alias ls="eza"
  alias ll="eza -l --git"
  alias la="eza -la --git"
fi

# bat alias
command -v batcat >/dev/null 2>&1 && alias bat=batcat

# fd alias + fzf integration — single check
if [[ -n $_fd_bin ]]; then
  (( ${+aliases[fd]} )) || alias fd=$_fd_bin
  export FZF_DEFAULT_COMMAND="$_fd_bin --type f --hidden --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
unset _fd_bin

# p10k prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf shell integration
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# zoxide — lazy init: define `z` wrapper that bootstraps on first call
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
