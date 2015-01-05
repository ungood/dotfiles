# Clear some things (helpful when sourcing .zshrc again)
precmd_functions=()

# Setup some paths (TODO: make more dynamic)
DOTFILES="$HOME/.dotfiles"
AMAZON_ROOT="$HOME/.amazon"
ZSH_ROOT="$HOME/.zsh"

# Load antigen and bundles
source "$DOTFILES/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle tmux

# "z" command for going to recent dirs.
antigen bundle rupa/z

if [[ -d "$ZSH_ROOT" ]]; then
    antigen bundle "$ZSH_ROOT"
    antigen theme "$ZSH_ROOT/themes" ungood
fi

# Amazon-specific stuff
if [[ -d "$AMAZON_ROOT" ]]; then
    antigen bundle "$AMAZON_ROOT" zsh
fi

# Host-specific overrides
if [[ -f "$HOME/.zshrc_local" ]]; then
    source "$HOME/.zshrc_local"
fi

# Make it so
antigen apply
