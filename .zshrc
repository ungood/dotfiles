# Clear some things (helpful when sourcing .zshrc again)
precmd_functions=()

# Setup some paths (TODO: make more dynamic)
DOTFILES="$HOME/.dotfiles"
AMAZON_ROOT="$HOME/.amazon"

# Load antigen and bundles
source "$DOTFILES/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle tmux
antigen bundle Tarrasch/zsh-autoenv # Useful auto-env support

# Useful python bundles
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
antigen bundle pyenv

# "z" command for going to recent dirs.
antigen bundle rupa/z

antigen bundle "ungood/zsh"
antigen theme "ungood/zsh" themes/ungood

# Amazon-specific stuff
if [[ -d $AMAZON_ROOT ]]; then
    antigen bundle "$AMAZON_ROOT" zsh --no-local-clone
fi

# Host-specific overrides
if [[ -f "$HOME/.zshrc_local" ]]; then
    source "$HOME/.zshrc_local"
fi

# Make it so
antigen apply

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
