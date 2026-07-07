#!/usr/bin/env bash
# Install dotfiles: packages, oh-my-zsh, powerlevel10k, zsh plugins,
# fzf, powerline (tmux) and symlinks. Idempotent - safe to re-run.
set -euo pipefail

DOTFILES="$HOME/.config/dotFiles"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

log()  { printf '\033[1;32m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*"; }

# --- Packages ---------------------------------------------------------------
install_packages() {
  if command -v apt-get >/dev/null; then
    log "Installing packages (apt)"
    sudo apt-get update
    sudo apt-get install -y \
      zsh git curl tmux neovim \
      ripgrep fd-find bat eza zoxide \
      python3-venv
  elif command -v pacman >/dev/null; then
    log "Installing packages (pacman)"
    sudo pacman -Syu --needed --noconfirm \
      zsh git curl tmux neovim \
      ripgrep fd bat eza zoxide fzf \
      python
  else
    warn "Unsupported distro: install packages manually"
  fi
}

# --- oh-my-zsh + theme + plugins ---------------------------------------------
install_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  clone_if_missing() {
    local url=$1 dest=$2
    [ -d "$dest" ] || { log "Cloning $(basename "$dest")"; git clone --depth 1 "$url" "$dest"; }
  }
  clone_if_missing https://github.com/romkatv/powerlevel10k.git        "$ZSH_CUSTOM/themes/powerlevel10k"
  clone_if_missing https://github.com/zsh-users/zsh-autosuggestions     "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
}

# --- fzf (from git; apt version is outdated) ---------------------------------
install_fzf() {
  if [ ! -d "$HOME/.fzf" ] && ! command -v fzf >/dev/null; then
    log "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install" --key-bindings --completion --no-update-rc
  fi
}

# --- powerline for tmux -------------------------------------------------------
install_powerline() {
  if [ ! -d "$DOTFILES/.env" ]; then
    log "Creating powerline venv"
    python3 -m venv "$DOTFILES/.env"
    "$DOTFILES/.env/bin/pip" install powerline-status powerline-mem-segment
  fi
}

# --- symlinks -----------------------------------------------------------------
link() {
  local src=$1 dest=$2
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    warn "Backing up existing $dest to $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sfn "$src" "$dest"
  log "Linked $dest -> $src"
}

install_symlinks() {
  link "$DOTFILES/.zshrc"            "$HOME/.zshrc"
  link "$DOTFILES/.tmux.conf"        "$HOME/.tmux.conf"
  link "$DOTFILES/.config/nvim"      "$HOME/.config/nvim"
  link "$DOTFILES/.config/powerline" "$HOME/.config/powerline"
}

# --- default shell -------------------------------------------------------------
set_shell() {
  if [ "$(basename "${SHELL:-}")" != "zsh" ]; then
    log "Setting zsh as default shell"
    chsh -s "$(command -v zsh)"
  fi
}

install_packages
install_zsh
install_fzf
install_powerline
install_symlinks
set_shell

log "Done. Start a new shell: exec zsh"
