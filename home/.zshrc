# Clear some things
precmd_functions=()

# Setup some directories (TODO: make more dynamic)
DOTFILES="$HOME/.dotfiles"

# oh-my-zsh settings
COMPLETION_WAITING_DOTS="false"
ZSH_CUSTOM="$DOTFILES/ohmyzsh"
ZSH_THEME="ungood"

# load antigen and bundles
source "$DOTFILES/antigen/antigen.zsh"
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
git
tmux

zsh-users/zsh-syntax-highlighting
EOBUNDLES

if [ -f "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi

antigen apply
