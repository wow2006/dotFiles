if [ -f "$HOME/.shell_utils/oh-my-zsh.sh" ]; then
  source $HOME/.shell_utils/oh-my-zsh.sh
fi

if [ -f "$HOME/.shell_utils/cuda.sh" ]; then
  source $HOME/.shell_utils/cuda.sh
fi

if [ -f "$HOME/.shell_utils/path.sh" ]; then
  source $HOME/.shell_utils/path.sh
fi

if [ -f "$HOME/.shell_utils/alias.sh" ]; then
  source $HOME/.shell_utils/alias.sh
fi

if [ -f "$HOME/.shell_utils/virtualenvs.sh" ]; then
  source $HOME/.shell_utils/virtualenvs.sh
fi

if [ -f "$HOME/.shell_utils/funtions.sh" ]; then
  source $HOME/.shell_utils/funtions.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Color man command
export PAGER="most"
export EDITOR=nvim

