# Dotfiles

## Installation

### Dependencies

- For Ubuntu

    ```bash
    $ sh install_ubuntu.sh
    ```

- For Arch

    ```bash
    $ sh install_arch.sh
    ```

### Config zsh

```bash
$ sudo apt install zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

### Config Neovim

```bash
$ cd ~/.config/
$ git clone https://github.com/wow2006/dotFiles.git
$ cd dotFiles
$ ln -s ~/.config/dotFiles/.config/nvim ~/.config/nvim
```

### Config tmux

```bash
$ sudo apt install python3.12-venv
$ cd ~/.config/dotFiles
$ python3 -m venv .env
$ source .env/bin/activate
$ python -m pip install powerline-status powerline-mem-segment
$ find . -type f -name "powerline.conf" # Edit ~/.tmux.conf with find output
$ export PATH=$HOME/.config/dotFiles/.env/bin:$PATH >> ~/.zshrc
$ ln -s ~/.config/dotFiles/.tmux.conf ~/.tmux.conf
$ ln -s ~/.config/dotFiles/.config/powerline/ ~/.config/
```
