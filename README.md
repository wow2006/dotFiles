# Dotfiles

## Installation

```bash
cd ~/.config
git clone https://github.com/wow2006/dotFiles.git
cd dotFiles
./install.sh
```

Supports Ubuntu/Debian (apt) and Arch (pacman). Idempotent — safe to re-run.

The script installs:

- Packages: zsh, git, curl, tmux, neovim, ripgrep, fd, bat, eza, zoxide
- oh-my-zsh with powerlevel10k theme
- zsh plugins: zsh-autosuggestions, zsh-syntax-highlighting
- fzf (from git; apt version is outdated)
- powerline for tmux (python venv in `.env/`)
- Symlinks: `~/.zshrc`, `~/.tmux.conf`, `~/.config/nvim`, `~/.config/powerline`
- Sets zsh as the default shell

Existing non-symlink configs are backed up as `*.bak`.
