source $HOME/.shellUtilities/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle <<EOBUNDLES
  git
  tmux
  python
  history
  history-substring-search
  archlinux
  command-not-found
  fzf
  man
  pip
  poetry
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  unixorn/warhol.plugin.zsh
  zsh-users/zsh-syntax-highlighting # must be last plugin to
  djui/alias-tips
EOBUNDLES

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# POWERLEVEL
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv vcs history)
# fzf binding
[ -f ~/.key-bindings.zsh ] && source ~/.key-bindings.zsh
# EXPORT
export PATH=$HOME/.local/bin:$PATH
# alias
alias vim=/usr/bin/nvim
alias gst="git status"
#alias gaf="git add $(git ls-files -m -o --exclude-standard | fzf -m)"
alias cpwd="pwd | tr -d '\n' | xclip -selection clipboard "

enable_gdb="echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope"
