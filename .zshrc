# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.config/dotFiles/.env/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
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

# User configuration

export EDITOR=nvim
export VISUAL=nvim

# Debian installs fd/bat under alternate names
command -v fdfind >/dev/null && alias fd=fdfind
command -v batcat >/dev/null && alias bat=batcat
command -v eza >/dev/null && alias ls="eza" && alias ll="eza -l --git" && alias la="eza -la --git"

# fzf: use fd for file listing when available
if command -v fdfind >/dev/null; then
  export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
